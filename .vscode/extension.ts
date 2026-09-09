import * as vscode from 'vscode';

const ADHD_RULES = `
## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.

Exceptions: explain fully when asked to explain. Confirm before destructive actions. After three failed fixes, stop and name the doubtful assumption. If the request is ambiguous, ask one short question.
`;

let obsessionModeActive = false;
let statusBarItem: vscode.StatusBarItem;

export function activate(context: vscode.ExtensionContext) {
    // Load saved state
    const savedState = context.globalState.get<boolean>('obsessionModeActive', false);
    obsessionModeActive = savedState;

    // Create status bar item
    statusBarItem = vscode.window.createStatusBarItem(
        vscode.StatusBarAlignment.Right,
        100
    );
    statusBarItem.command = 'obsession-ai.toggle';
    context.subscriptions.push(statusBarItem);

    // Register commands
    context.subscriptions.push(
        vscode.commands.registerCommand('obsession-ai.toggle', toggleAdhdMode)
    );
    context.subscriptions.push(
        vscode.commands.registerCommand('obsession-ai.enable', enableAdhdMode)
    );
    context.subscriptions.push(
        vscode.commands.registerCommand('obsession-ai.disable', disableAdhdMode)
    );
    context.subscriptions.push(
        vscode.commands.registerCommand('obsession-ai.copyRules', copyRulesToClipboard)
    );

    // Update UI
    updateStatusBar();

    // Show info message on first activation
    if (obsessionModeActive) {
        vscode.window.showInformationMessage('ADHD-friendly mode is enabled');
    }
}

function toggleAdhdMode() {
    obsessionModeActive = !obsessionModeActive;
    updateStatusBar();
    
    vscode.workspace.getConfiguration('obsession-ai').update(
        'alwaysOn',
        obsessionModeActive,
        vscode.ConfigurationTarget.Global
    );

    const message = obsessionModeActive 
        ? 'ADHD-friendly mode enabled' 
        : 'ADHD-friendly mode disabled';
    
    vscode.window.showInformationMessage(message);
}

function enableAdhdMode() {
    if (!obsessionModeActive) {
        toggleAdhdMode();
    }
}

function disableAdhdMode() {
    if (obsessionModeActive) {
        toggleAdhdMode();
    }
}

async function copyRulesToClipboard() {
    await vscode.env.clipboard.writeText(ADHD_RULES);
    vscode.window.showInformationMessage('ADHD rules copied to clipboard!');
}

function updateStatusBar() {
    if (obsessionModeActive) {
        statusBarItem.text = '$(check-all) ADHD ON';
        statusBarItem.tooltip = 'ADHD-friendly mode is active. Click to toggle.';
        statusBarItem.backgroundColor = new vscode.ThemeColor('statusBarItem.prominentBackground');
    } else {
        statusBarItem.text = '$(circle-slash) ADHD OFF';
        statusBarItem.tooltip = 'ADHD-friendly mode is off. Click to enable.';
        statusBarItem.backgroundColor = undefined;
    }
    
    const showStatus = vscode.workspace.getConfiguration('obsession-ai').get('showStatus', true);
    if (showStatus) {
        statusBarItem.show();
    } else {
        statusBarItem.hide();
    }
}

export function deactivate() {
    if (statusBarItem) {
        statusBarItem.dispose();
    }
}
