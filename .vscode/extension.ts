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

let adhdModeActive = false;
let statusBarItem: vscode.StatusBarItem;

export function activate(context: vscode.ExtensionContext) {
    // Load saved state
    const savedState = context.globalState.get<boolean>('adhdModeActive', false);
    adhdModeActive = savedState;

    // Create status bar item
    statusBarItem = vscode.window.createStatusBarItem(
        vscode.StatusBarAlignment.Right,
        100
    );
    statusBarItem.command = 'i-have-adhd.toggle';
    context.subscriptions.push(statusBarItem);

    // Register commands
    context.subscriptions.push(
        vscode.commands.registerCommand('i-have-adhd.toggle', toggleAdhdMode)
    );
    context.subscriptions.push(
        vscode.commands.registerCommand('i-have-adhd.enable', enableAdhdMode)
    );
    context.subscriptions.push(
        vscode.commands.registerCommand('i-have-adhd.disable', disableAdhdMode)
    );
    context.subscriptions.push(
        vscode.commands.registerCommand('i-have-adhd.copyRules', copyRulesToClipboard)
    );

    // Update UI
    updateStatusBar();

    // Show info message on first activation
    if (adhdModeActive) {
        vscode.window.showInformationMessage('ADHD-friendly mode is enabled');
    }
}

function toggleAdhdMode() {
    adhdModeActive = !adhdModeActive;
    updateStatusBar();
    
    vscode.workspace.getConfiguration('i-have-adhd').update(
        'alwaysOn',
        adhdModeActive,
        vscode.ConfigurationTarget.Global
    );

    const message = adhdModeActive 
        ? 'ADHD-friendly mode enabled' 
        : 'ADHD-friendly mode disabled';
    
    vscode.window.showInformationMessage(message);
}

function enableAdhdMode() {
    if (!adhdModeActive) {
        toggleAdhdMode();
    }
}

function disableAdhdMode() {
    if (adhdModeActive) {
        toggleAdhdMode();
    }
}

async function copyRulesToClipboard() {
    await vscode.env.clipboard.writeText(ADHD_RULES);
    vscode.window.showInformationMessage('ADHD rules copied to clipboard!');
}

function updateStatusBar() {
    if (adhdModeActive) {
        statusBarItem.text = '$(check-all) ADHD ON';
        statusBarItem.tooltip = 'ADHD-friendly mode is active. Click to toggle.';
        statusBarItem.backgroundColor = new vscode.ThemeColor('statusBarItem.prominentBackground');
    } else {
        statusBarItem.text = '$(circle-slash) ADHD OFF';
        statusBarItem.tooltip = 'ADHD-friendly mode is off. Click to enable.';
        statusBarItem.backgroundColor = undefined;
    }
    
    const showStatus = vscode.workspace.getConfiguration('i-have-adhd').get('showStatus', true);
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
