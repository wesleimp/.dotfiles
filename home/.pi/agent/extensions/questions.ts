/**
 * Question Tool — Structured user input with OpenCode-style UI.
 *
 * Features:
 * - Single or multi-question mode with tab navigation
 * - Single-select (immediate submit) or multi-select (checkboxes)
 * - Optional "Type your own answer" custom input
 * - Confirm tab for reviewing answers before submitting
 * - Number keys 1–9 for quick option selection
 * - Vim-style navigation (h/j/k/l)
 */

import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import {
  Editor,
  type EditorTheme,
  Key,
  matchesKey,
  Text,
  visibleWidth,
  wrapTextWithAnsi,
} from "@earendil-works/pi-tui";
import { Type } from "typebox";

// ── Types ──────────────────────────────────────────────────────────────────

interface QuestionInput {
  question: string;
  header?: string;
  options: Array<{ label: string; description?: string }>;
  multiple?: boolean;
  custom?: boolean;
}

interface NormalizedQuestion {
  question: string;
  header: string;
  options: Array<{ label: string; description?: string }>;
  multiple: boolean;
  custom: boolean;
}

interface QuestionDetails {
  questions: NormalizedQuestion[];
  answers: string[][];
  cancelled: boolean;
}

// ── Tool metadata ──────────────────────────────────────────────────────────

export const name = "question";

export const description = `Use this tool when you need to ask the user questions during execution. This allows you to:
1. Gather user preferences or requirements
2. Clarify ambiguous instructions
3. Get decisions on implementation choices as you work
4. Offer choices to the user about what direction to take.

Usage notes:
- When \`custom\` is enabled (default), a "Type your own answer" option is added automatically; don't include "Other" or catch-all options
- Answers are returned as arrays of labels; set \`multiple: true\` to allow selecting more than one
- If you recommend a specific option, make that the first option in the list and add "(Recommended)" at the end of the label`;

// ── Schema ─────────────────────────────────────────────────────────────────

const OptionSchema = Type.Object({
  label: Type.String({ description: "Display text (1-5 words, concise)" }),
  description: Type.Optional(Type.String({ description: "Explanation of choice" })),
});

const QuestionSchema = Type.Object({
  question: Type.String({ description: "Complete question" }),
  header: Type.Optional(
    Type.String({ description: "Very short label for tab bar (max 30 chars)" }),
  ),
  options: Type.Array(OptionSchema, { description: "Available choices" }),
  multiple: Type.Optional(Type.Boolean({ description: "Allow selecting multiple choices" })),
  custom: Type.Optional(
    Type.Boolean({ description: "Allow typing a custom answer (default: true)" }),
  ),
});

const QuestionParams = Type.Object({
  questions: Type.Array(QuestionSchema, {
    description: "Questions to ask the user",
  }),
});

// ── Helpers ────────────────────────────────────────────────────────────────

function errorResult(message: string): {
  content: Array<{ type: "text"; text: string }>;
  details: QuestionDetails;
} {
  return {
    content: [{ type: "text", text: message }],
    details: { questions: [], answers: [], cancelled: true },
  };
}

// ── Extension ──────────────────────────────────────────────────────────────

export default function (pi: ExtensionAPI) {
  pi.registerTool({
    name,
    label: "Question",
    description,
    parameters: QuestionParams,
    executionMode: "sequential",

    async execute(_toolCallId, params, _signal, _onUpdate, ctx) {
      if (ctx.mode !== "tui") {
        return errorResult("Error: UI not available (running in non-interactive mode)");
      }
      if (params.questions.length === 0) {
        return errorResult("Error: No questions provided");
      }

      // Normalize questions with defaults
      const questions: NormalizedQuestion[] = params.questions.map((q, i) => ({
        question: q.question,
        header: q.header || `Q${i + 1}`,
        options: q.options,
        multiple: q.multiple ?? false,
        custom: q.custom !== false,
      }));

      // Single = 1 question + single-select → no tabs, immediate submit
      const isSingle = questions.length === 1 && !questions[0].multiple;
      const totalTabs = isSingle ? 1 : questions.length + 1;

      const result = await ctx.ui.custom<QuestionDetails>((tui, theme, _kb, done) => {
        // ── State ────────────────────────────────────────────────
        let currentTab = 0;
        let selected = 0;
        let editing = false;
        let cachedLines: string[] | undefined;
        const answers: string[][] = questions.map(() => []);
        const customInputs: string[] = questions.map(() => "");

        const editorTheme: EditorTheme = {
          borderColor: (s) => theme.fg("accent", s),
          selectList: {
            selectedPrefix: (t) => theme.fg("accent", t),
            selectedText: (t) => theme.fg("accent", t),
            description: (t) => theme.fg("muted", t),
            scrollInfo: (t) => theme.fg("dim", t),
            noMatch: (t) => theme.fg("warning", t),
          },
        };
        const editor = new Editor(tui, editorTheme);

        // ── Helpers ──────────────────────────────────────────────

        function refresh() {
          cachedLines = undefined;
          tui.requestRender();
        }

        function q(): NormalizedQuestion | undefined {
          return questions[currentTab];
        }

        function isConfirm(): boolean {
          return !isSingle && currentTab === questions.length;
        }

        function optCount(): number {
          const cur = q();
          if (!cur) return 0;
          return cur.options.length + (cur.custom ? 1 : 0);
        }

        function isCustomSelected(): boolean {
          const cur = q();
          return !!cur?.custom && selected === cur.options.length;
        }

        function allAnswered(): boolean {
          return questions.every((_, i) => answers[i].length > 0);
        }

        function submit() {
          done({ questions, answers, cancelled: false });
        }

        function reject() {
          done({ questions, answers, cancelled: true });
        }

        function pick(label: string) {
          answers[currentTab] = [label];
          if (isSingle) {
            submit();
            return;
          }
          // Advance to next unanswered or confirm
          if (currentTab < questions.length - 1) {
            currentTab++;
          } else {
            currentTab = questions.length;
          }
          selected = 0;
          refresh();
        }

        function toggle(label: string) {
          const arr = answers[currentTab];
          const idx = arr.indexOf(label);
          if (idx === -1) arr.push(label);
          else arr.splice(idx, 1);
          refresh();
        }

        function selectTab(index: number) {
          currentTab = index;
          selected = 0;
          refresh();
        }

        function selectOption() {
          const cur = q();
          if (!cur) return;

          if (isCustomSelected()) {
            if (!cur.multiple) {
              editing = true;
              editor.setText(customInputs[currentTab] || "");
              refresh();
              return;
            }
            // Multi: toggle existing custom or start editing
            const customVal = customInputs[currentTab];
            if (customVal && answers[currentTab].includes(customVal)) {
              toggle(customVal);
              return;
            }
            editing = true;
            editor.setText(customInputs[currentTab] || "");
            refresh();
            return;
          }

          const opt = cur.options[selected];
          if (!opt) return;

          if (cur.multiple) {
            toggle(opt.label);
          } else {
            pick(opt.label);
          }
        }

        // ── Editor submit ────────────────────────────────────────

        editor.onSubmit = (value) => {
          const trimmed = value.trim();
          if (!trimmed) {
            editing = false;
            editor.setText("");
            refresh();
            return;
          }

          const cur = q();
          if (!cur) return;

          const prev = customInputs[currentTab];
          customInputs[currentTab] = trimmed;

          if (cur.multiple) {
            const arr = answers[currentTab];
            if (prev) {
              const idx = arr.indexOf(prev);
              if (idx !== -1) arr.splice(idx, 1);
            }
            if (!arr.includes(trimmed)) arr.push(trimmed);
            editing = false;
            editor.setText("");
            refresh();
          } else {
            editing = false;
            editor.setText("");
            pick(trimmed);
          }
        };

        // ── Input handling ────────────────────────────────────────

        function handleInput(data: string) {
          // Editor mode
          if (editing) {
            if (matchesKey(data, Key.escape)) {
              editing = false;
              editor.setText("");
              refresh();
              return;
            }
            editor.handleInput(data);
            refresh();
            return;
          }

          // Confirm tab
          if (isConfirm()) {
            if (matchesKey(data, Key.enter) && allAnswered()) {
              submit();
              return;
            }
            if (matchesKey(data, Key.escape)) {
              reject();
              return;
            }
            if (matchesKey(data, Key.tab) || matchesKey(data, Key.right) || data === "l") {
              selectTab(0);
              return;
            }
            if (matchesKey(data, Key.shift("tab")) || matchesKey(data, Key.left) || data === "h") {
              selectTab(questions.length - 1);
              return;
            }
            return;
          }

          const total = optCount();

          // Tab navigation (multi-question only)
          if (!isSingle) {
            if (matchesKey(data, Key.tab) || matchesKey(data, Key.right) || data === "l") {
              selectTab((currentTab + 1) % totalTabs);
              return;
            }
            if (matchesKey(data, Key.shift("tab")) || matchesKey(data, Key.left) || data === "h") {
              selectTab((currentTab - 1 + totalTabs) % totalTabs);
              return;
            }
          }

          // Option navigation
          if (matchesKey(data, Key.up) || data === "k") {
            selected = (selected - 1 + total) % total;
            refresh();
            return;
          }
          if (matchesKey(data, Key.down) || data === "j") {
            selected = (selected + 1) % total;
            refresh();
            return;
          }

          // Number keys 1–9
          if (data >= "1" && data <= "9") {
            const idx = parseInt(data, 10) - 1;
            if (idx < total) {
              selected = idx;
              selectOption();
            }
            return;
          }

          // Select
          if (matchesKey(data, Key.enter)) {
            selectOption();
            return;
          }

          // Cancel
          if (matchesKey(data, Key.escape)) {
            reject();
          }
        }

        // ── Rendering ────────────────────────────────────────────

        function render(width: number): string[] {
          if (cachedLines) return cachedLines;

          const lines: string[] = [];
          const w = Math.max(1, width);

          function addWrapped(text: string) {
            lines.push(...wrapTextWithAnsi(text, w));
          }

          function addPrefixed(prefix: string, text: string) {
            const pw = visibleWidth(prefix);
            if (pw >= w) {
              addWrapped(prefix + text);
              return;
            }
            const wrapped = wrapTextWithAnsi(text, w - pw);
            const pad = " ".repeat(pw);
            for (let i = 0; i < wrapped.length; i++) {
              lines.push(`${i === 0 ? prefix : pad}${wrapped[i]}`);
            }
          }

          // ── Top border ───────────────────────────────────────
          lines.push(theme.fg("accent", "─".repeat(w)));

          // ── Tab bar (multi-question only) ────────────────────
          if (!isSingle) {
            const tabs: string[] = [theme.fg("dim", "← ")];

            for (let i = 0; i < questions.length; i++) {
              const isActive = i === currentTab;
              const isAnswered = answers[i].length > 0;
              const label = ` ${questions[i].header} `;

              if (isActive) {
                tabs.push(theme.bg("selectedBg", theme.fg("text", label)));
              } else if (isAnswered) {
                tabs.push(theme.fg("success", label));
              } else {
                tabs.push(theme.fg("muted", label));
              }
              tabs.push(" ");
            }

            const confirmLabel = " Confirm ";
            if (isConfirm()) {
              tabs.push(theme.bg("selectedBg", theme.fg("text", confirmLabel)));
            } else if (allAnswered()) {
              tabs.push(theme.fg("success", confirmLabel));
            } else {
              tabs.push(theme.fg("dim", confirmLabel));
            }
            tabs.push(theme.fg("dim", " →"));

            addPrefixed("  ", tabs.join(""));
            lines.push("");
          }

          // ── Confirm tab ──────────────────────────────────────
          if (isConfirm()) {
            addPrefixed("  ", theme.fg("text", "Review"));
            lines.push("");

            for (let i = 0; i < questions.length; i++) {
              const hdr = questions[i].header;
              const ans = answers[i];
              const value = ans.join(", ");
              const label = theme.fg("muted", `${hdr}: `);
              if (value) {
                addPrefixed("  ", label + theme.fg("text", value));
              } else {
                addPrefixed("  ", label + theme.fg("error", "(not answered)"));
              }
            }

            lines.push("");
            if (allAnswered()) {
              addPrefixed("  ", theme.fg("success", "Press Enter to submit"));
            } else {
              const missing = questions
                .filter((_, i) => answers[i].length === 0)
                .map((qst) => qst.header)
                .join(", ");
              addPrefixed("  ", theme.fg("warning", `Unanswered: ${missing}`));
            }
          } else {
            // ── Question content ────────────────────────────
            const cur = q()!;
            const suffix = cur.multiple ? " (select all that apply)" : "";
            addPrefixed("  ", theme.fg("text", cur.question + suffix));
            lines.push("");

            // Options
            for (let i = 0; i < cur.options.length; i++) {
              renderOption(addPrefixed, cur, i, cur.options[i].label, cur.options[i].description);
            }

            // Custom option
            if (cur.custom) {
              const customIdx = cur.options.length;
              const isActive = selected === customIdx;
              const customVal = customInputs[currentTab];
              const customPicked = customVal ? answers[currentTab].includes(customVal) : false;

              const prefix = isActive ? theme.fg("accent", "> ") : "  ";
              const num = theme.fg(isActive ? "accent" : "muted", `${customIdx + 1}. `);

              let label: string;
              if (cur.multiple) {
                const check = customPicked ? "✓" : " ";
                label = `[${check}] Type your own answer`;
              } else {
                label = "Type your own answer";
              }

              const labelStr = theme.fg(
                isActive ? "accent" : customPicked ? "success" : "text",
                label,
              );
              const check = !cur.multiple && customPicked ? theme.fg("success", " ✓") : "";
              addPrefixed(prefix, num + labelStr + check);

              if (editing) {
                addPrefixed("     ", theme.fg("muted", "Your answer:"));
                for (const line of editor.render(Math.max(1, w - 6))) {
                  lines.push(`      ${line}`);
                }
              } else if (customVal) {
                addPrefixed("     ", theme.fg("muted", customVal));
              }
            }
          }

          // ── Footer hints ─────────────────────────────────────
          lines.push("");
          const hints: string[] = [];
          if (editing) {
            hints.push("enter " + theme.fg("muted", "submit"));
            hints.push("esc " + theme.fg("muted", "cancel"));
          } else {
            if (!isSingle) {
              hints.push("⇆ " + theme.fg("muted", "tab"));
            }
            if (!isConfirm()) {
              hints.push("↑↓ " + theme.fg("muted", "select"));
            }
            const action = isConfirm()
              ? "submit"
              : q()?.multiple
                ? "toggle"
                : isSingle
                  ? "submit"
                  : "confirm";
            hints.push("enter " + theme.fg("muted", action));
            hints.push("esc " + theme.fg("muted", "dismiss"));
          }
          addPrefixed("  ", theme.fg("text", hints.join("  ")));

          // ── Bottom border ────────────────────────────────────
          lines.push(theme.fg("accent", "─".repeat(w)));

          cachedLines = lines;
          return lines;
        }

        function renderOption(
          addPrefixed: (prefix: string, text: string) => void,
          curQ: NormalizedQuestion,
          idx: number,
          label: string,
          desc: string | undefined,
        ) {
          const isActive = idx === selected;
          const isPicked = answers[currentTab].includes(label);

          const prefix = isActive ? theme.fg("accent", "> ") : "  ";
          const num = theme.fg(isActive ? "accent" : "muted", `${idx + 1}. `);

          let displayLabel: string;
          if (curQ.multiple) {
            const check = isPicked ? "✓" : " ";
            displayLabel = `[${check}] ${label}`;
          } else {
            displayLabel = label;
          }

          const labelStr = theme.fg(
            isActive ? "accent" : isPicked ? "success" : "text",
            displayLabel,
          );
          const check = !curQ.multiple && isPicked ? theme.fg("success", " ✓") : "";
          addPrefixed(prefix, num + labelStr + check);

          if (desc) {
            addPrefixed("     ", theme.fg("muted", desc));
          }
        }

        return {
          render,
          invalidate: () => {
            cachedLines = undefined;
          },
          handleInput,
        };
      });

      // ── Build response ───────────────────────────────────────────────

      if (result.cancelled) {
        return {
          content: [
            {
              type: "text",
              text: "The user dismissed this question",
            },
          ],
          details: result,
        };
      }

      const formatted = questions
        .map((qst, i) => {
          const ans = result.answers[i];
          return `"${qst.question}"="${ans.length ? ans.join(", ") : "Unanswered"}"`;
        })
        .join(", ");

      return {
        content: [
          {
            type: "text",
            text: `User has answered your questions: ${formatted}. You can now continue with the user's answers in mind.`,
          },
        ],
        details: result,
      };
    },

    // ── Render call ──────────────────────────────────────────────────────

    renderCall(args, theme, _context) {
      const qs = (args.questions as QuestionInput[]) || [];
      let text = theme.fg("toolTitle", theme.bold("question "));

      if (qs.length === 1) {
        text += theme.fg("muted", qs[0].question);
        const opts = qs[0].options || [];
        if (opts.length) {
          const numbered = opts.map((o, i) => `${i + 1}. ${o.label}`);
          if (qs[0].custom !== false) {
            numbered.push(`${opts.length + 1}. Type your own answer`);
          }
          text += `\n${theme.fg("dim", `  Options: ${numbered.join(", ")}`)}`;
        }
      } else {
        text += theme.fg("muted", `${qs.length} question${qs.length !== 1 ? "s" : ""}`);
        const headers = qs.map((qst, i) => qst.header || `Q${i + 1}`).join(", ");
        text += theme.fg("dim", ` (${headers})`);
      }

      return new Text(text, 0, 0);
    },

    // ── Render result ────────────────────────────────────────────────────

    renderResult(result, _options, theme, _context) {
      const details = result.details as QuestionDetails | undefined;
      if (!details) {
        const text = result.content[0];
        return new Text(text?.type === "text" ? text.text : "", 0, 0);
      }

      if (details.cancelled) {
        return new Text(theme.fg("warning", "Dismissed"), 0, 0);
      }

      if (details.questions.length === 1) {
        const ans = details.answers[0];
        const display = ans.length > 0 ? ans.join(", ") : "(no answer)";
        return new Text(theme.fg("success", "✓ ") + theme.fg("accent", display), 0, 0);
      }

      const lines = details.questions.map((qst, i) => {
        const ans = details.answers[i];
        const display = ans.length > 0 ? ans.join(", ") : "(no answer)";
        return `${theme.fg("success", "✓ ")}${theme.fg("muted", `${qst.header}: `)}${theme.fg("accent", display)}`;
      });
      return new Text(lines.join("\n"), 0, 0);
    },
  });
}
