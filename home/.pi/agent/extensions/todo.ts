/**
 * Todo Write Tool — OpenCode-style structured task tracking.
 *
 * Full-replace approach: the LLM sends the entire todo list each call.
 * State is persisted in tool result details for proper branching support.
 * A widget above the editor shows progress when incomplete todos exist.
 */

import { StringEnum } from "@earendil-works/pi-ai";
import type { ExtensionAPI, ExtensionContext, Theme } from "@earendil-works/pi-coding-agent";
import { Text } from "@earendil-works/pi-tui";
import { Type } from "typebox";

// ── Types ──────────────────────────────────────────────────────────────────

interface TodoItem {
  content: string;
  status: "pending" | "in_progress" | "completed" | "cancelled";
  priority: "high" | "medium" | "low";
}

interface TodoDetails {
  todos: TodoItem[];
}

// ── Tool metadata ──────────────────────────────────────────────────────────

const TOOL_NAME = "todo_write";

const DESCRIPTION = `Create and maintain a structured task list for the current coding session. Tracks progress, organizes multi-step work, and surfaces status to the user.

## When to use
Use proactively when:
- The task requires 3+ distinct steps or actions (not just 3 tool calls for a single conceptual step)
- The work is non-trivial and benefits from planning
- The user provides multiple tasks (numbered or comma-separated) or explicitly asks for a todo list
- New instructions arrive — capture them as todos
- You start a task — mark it \`in_progress\` (only one at a time) before working
- You finish a task — mark it \`completed\` and add any follow-ups discovered during the work

## When NOT to use
Skip when:
- The work is a single, straightforward task (or <3 trivial steps)
- The request is purely informational or conversational
- Tracking adds no organizational value

## States
- \`pending\` — not started
- \`in_progress\` — actively working (exactly ONE at a time)
- \`completed\` — finished successfully
- \`cancelled\` — no longer needed

## Rules
- Each call REPLACES the entire list. Always pass the complete todos array.
- Update status in real time; don't batch completions
- Mark \`completed\` only after the required work is actually done, including any required verification. Never based on intent.
- Keep exactly one \`in_progress\` while work remains
- If blocked or partial, keep it \`in_progress\` and add a follow-up todo describing the blocker
- Items should be specific and actionable; break large work into smaller steps`;

// ── Schema ─────────────────────────────────────────────────────────────────

const TodoSchema = Type.Object({
  content: Type.String({ description: "Brief description of the task" }),
  status: StringEnum(["pending", "in_progress", "completed", "cancelled"] as const, {
    description: "Current status: pending, in_progress, completed, cancelled",
  }),
  priority: StringEnum(["high", "medium", "low"] as const, {
    description: "Priority level: high, medium, low",
  }),
});

const TodoWriteParams = Type.Object({
  todos: Type.Array(TodoSchema, { description: "The complete updated todo list (full replace)" }),
});

// ── Rendering helpers ──────────────────────────────────────────────────────

function statusIcon(status: string, theme: Theme): string {
  switch (status) {
    case "in_progress":
      return theme.fg("warning", "•");
    case "completed":
      return theme.fg("success", "✓");
    case "cancelled":
      return theme.fg("dim", "×");
    default:
      return " ";
  }
}

function statusColor(status: string): "warning" | "dim" | "muted" | "text" {
  switch (status) {
    case "in_progress":
      return "warning";
    case "completed":
      return "dim";
    case "cancelled":
      return "dim";
    default:
      return "text";
  }
}

function progressText(todos: TodoItem[]): string {
  const done = todos.filter((t) => t.status === "completed" || t.status === "cancelled").length;
  return `${done}/${todos.length}`;
}

function renderTodoLine(todo: TodoItem, theme: Theme): string {
  const icon = statusIcon(todo.status, theme);
  const color = statusColor(todo.status);
  const text = theme.fg(color, todo.content);
  return `[${icon}] ${text}`;
}

// ── Extension ──────────────────────────────────────────────────────────────

export default function (pi: ExtensionAPI) {
  let currentTodos: TodoItem[] = [];
  let widgetVisible = true;

  // ── State reconstruction ─────────────────────────────────────────────

  function reconstructState(ctx: ExtensionContext) {
    currentTodos = [];

    for (const entry of ctx.sessionManager.getBranch()) {
      if (entry.type !== "message") continue;
      const msg = entry.message;
      if (msg.role !== "toolResult" || msg.toolName !== TOOL_NAME) continue;

      const details = msg.details as TodoDetails | undefined;
      if (details?.todos) {
        currentTodos = [...details.todos];
      }
    }
  }

  function refreshWidget() {
    if (!widgetVisible) {
      pi.events.emit("todo:updated", []);
      return;
    }

    const hasIncomplete = currentTodos.some(
      (t) => t.status !== "completed" && t.status !== "cancelled",
    );

    if (currentTodos.length === 0 || !hasIncomplete) {
      pi.events.emit("todo:updated", []);
      return;
    }

    pi.events.emit("todo:updated", currentTodos);
  }

  // ── Session events ───────────────────────────────────────────────────

  pi.on("session_start", async (_event, ctx) => {
    reconstructState(ctx);

    // Set up widget
    ctx.ui.setWidget("todo", (_tui, theme) => {
      let todos: TodoItem[] = [...currentTodos];
      let cachedLines: string[] | undefined;

      pi.events.on("todo:updated", (newTodos: TodoItem[]) => {
        todos = newTodos;
        cachedLines = undefined;
      });

      return {
        render(): string[] {
          if (cachedLines) return cachedLines;

          const hasIncomplete = todos.some(
            (t) => t.status !== "completed" && t.status !== "cancelled",
          );

          if (todos.length === 0 || !hasIncomplete) {
            cachedLines = [];
            return cachedLines;
          }

          const lines: string[] = [];

          // Header: Todo  3/5
          const progress = progressText(todos);
          lines.push(`  ${theme.bold("Todo")}  ${theme.fg("muted", progress)}`);

          // Todo items
          for (const todo of todos) {
            lines.push(`  ${renderTodoLine(todo, theme)}`);
          }

          lines.push("");
          cachedLines = lines;
          return lines;
        },
        invalidate() {
          cachedLines = undefined;
        },
      };
    });

    refreshWidget();
  });

  pi.on("session_tree", async (_event, ctx) => {
    reconstructState(ctx);
    refreshWidget();
  });

  // ── Tool ─────────────────────────────────────────────────────────────

  pi.registerTool({
    name: TOOL_NAME,
    label: "Todo",
    description: DESCRIPTION,
    parameters: TodoWriteParams,
    promptSnippet: "Create and maintain a structured task list for the current coding session",
    promptGuidelines: [
      "Use todo_write proactively when the task requires 3+ distinct steps, the user provides multiple tasks, or the work benefits from planning. Each call replaces the entire todo list.",
      "When using todo_write, keep exactly one todo in_progress at a time. Mark completed only after work is verified done — never on intent alone.",
    ],

    async execute(_toolCallId, params, _signal, _onUpdate, _ctx) {
      currentTodos = [...params.todos];

      const open = params.todos.filter(
        (t) => t.status !== "completed" && t.status !== "cancelled",
      ).length;

      refreshWidget();

      return {
        content: [
          {
            type: "text",
            text: JSON.stringify(params.todos, null, 2),
          },
        ],
        details: { todos: params.todos } as TodoDetails,
      };
    },

    // ── Render call ──────────────────────────────────────────────────

    renderCall(args, theme, _context) {
      const todos = (args.todos as TodoItem[]) || [];
      const open = todos.filter((t) => t.status !== "completed" && t.status !== "cancelled").length;
      const total = todos.length;

      let text = theme.fg("toolTitle", theme.bold("todo_write "));
      text += theme.fg("muted", `${open} open`);
      text += theme.fg("dim", ` / ${total} total`);

      return new Text(text, 0, 0);
    },

    // ── Render result ────────────────────────────────────────────────

    renderResult(result, { expanded }, theme, _context) {
      const details = result.details as TodoDetails | undefined;
      if (!details?.todos) {
        const text = result.content[0];
        return new Text(text?.type === "text" ? text.text : "", 0, 0);
      }

      const todos = details.todos;
      if (todos.length === 0) {
        return new Text(theme.fg("dim", "No todos"), 0, 0);
      }

      const done = todos.filter((t) => t.status === "completed" || t.status === "cancelled").length;
      const open = todos.length - done;

      let text = theme.fg("success", `${done} done`);
      if (open > 0) {
        text += theme.fg("muted", ` · ${open} open`);
      }

      if (expanded) {
        for (const todo of todos) {
          text += `\n${renderTodoLine(todo, theme)}`;
        }
      }

      return new Text(text, 0, 0);
    },
  });

  // ── /todos command (toggle widget visibility) ─────────────────────────

  pi.registerCommand("todos", {
    description: "Toggle the todo list widget above the editor",
    handler: async (_args, ctx) => {
      if (currentTodos.length === 0) {
        ctx.ui.notify("No todos yet", "info");
        return;
      }

      widgetVisible = !widgetVisible;
      refreshWidget();

      ctx.ui.notify(widgetVisible ? "Todo list visible" : "Todo list hidden", "info");
    },
  });
}
