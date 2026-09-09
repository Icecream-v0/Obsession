package com.github.ayghri.adhd;

import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.ui.Messages;
import org.jetbrains.annotations.NotNull;

public class ToggleAdhdAction extends AnAction {
    
    @Override
    public void actionPerformed(@NotNull AnActionEvent e) {
        AdhdSettings settings = AdhdSettings.getInstance();
        boolean newState = !settings.isAdhdModeEnabled();
        settings.setAdhdModeEnabled(newState);
        
        String message = newState 
            ? "ADHD-friendly mode enabled\n\nAI responses will now:\n• Lead with the next action\n• Number multi-step tasks\n• End with concrete next steps\n• Skip preamble and closers"
            : "ADHD-friendly mode disabled";
        
        Messages.showInfoMessage(message, "I Have ADHD");
    }
    
    @Override
    public void update(@NotNull AnActionEvent e) {
        AdhdSettings settings = AdhdSettings.getInstance();
        e.getPresentation().setText(
            settings.isAdhdModeEnabled() ? "Disable ADHD Mode" : "Enable ADHD Mode"
        );
        e.getPresentation().setDescription(
            "Toggle ADHD-friendly formatting for AI coding assistant responses"
        );
    }
}
