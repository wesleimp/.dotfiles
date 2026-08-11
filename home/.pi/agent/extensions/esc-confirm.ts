/**
 * ESC Confirmation Extension
 *
 * Requires a double-ESC to interrupt the agent while it's running.
 * First ESC shows "Press ESC again to interrupt" in the footer.
 * Second ESC within 1.5s actually interrupts. After timeout, resets.
 * When idle, ESC passes through normally.
 */

import { CustomEditor, type ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { matchesKey } from "@earendil-works/pi-tui";

const STATUS_KEY = "esc-confirm";
const TIMEOUT_MS = 1500;

// Shared state between editor and event handlers
let agentRunning = false;
let pendingEsc = false;
let escTimer: ReturnType<typeof setTimeout> | undefined;
let clearStatus: (() => void) | undefined;

function resetEscState() {
  pendingEsc = false;
  if (escTimer !== undefined) {
    clearTimeout(escTimer);
    escTimer = undefined;
  }
  clearStatus?.();
}

class EscConfirmEditor extends CustomEditor {
  handleInput(data: string): void {
    if (matchesKey(data, "escape")) {
      if (!agentRunning) {
        // Agent is idle — pass through normally
        resetEscState();
        super.handleInput(data);
        return;
      }

      if (pendingEsc) {
        // Second ESC within timeout — actually interrupt
        resetEscState();
        super.handleInput(data);
        return;
      }

      // First ESC while agent is running — show warning, start timer
      pendingEsc = true;
      showStatus?.();

      escTimer = setTimeout(() => {
        resetEscState();
      }, TIMEOUT_MS);

      return;
    }

    // Any other key resets the ESC state
    if (pendingEsc) {
      resetEscState();
    }

    super.handleInput(data);
  }
}

// Callback set by session_start to show/clear footer status
let showStatus: (() => void) | undefined;

export default function (pi: ExtensionAPI) {
  pi.on("agent_start", async () => {
    agentRunning = true;
  });

  pi.on("agent_settled", async () => {
    agentRunning = false;
    resetEscState();
  });

  pi.on("session_start", (_event, ctx) => {
    showStatus = () => {
      ctx.ui.setStatus(STATUS_KEY, ctx.ui.theme.fg("warning", "Press ESC again to interrupt"));
    };

    clearStatus = () => {
      ctx.ui.setStatus(STATUS_KEY, undefined);
    };

    ctx.ui.setEditorComponent((tui, theme, kb) => new EscConfirmEditor(tui, theme, kb));
  });

  pi.on("session_shutdown", () => {
    resetEscState();
    agentRunning = false;
    showStatus = undefined;
    clearStatus = undefined;
  });
}
