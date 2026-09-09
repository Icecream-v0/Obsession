package com.github.ayghri.adhd;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import org.jetbrains.annotations.NotNull;

@State(name = "AdhdSettings", storages = @Storage("i-have-adhd.xml"))
public class AdhdSettings implements PersistentStateComponent<AdhdSettings.MyState> {
    
    public static class MyState {
        public boolean adhdModeEnabled = false;
        public boolean showStatusBar = true;
    }
    
    private MyState myState = new MyState();
    
    public static AdhdSettings getInstance() {
        return ApplicationManager.getApplication().getService(AdhdSettings.class);
    }
    
    @Override
    public MyState getState() {
        return myState;
    }
    
    @Override
    public void loadState(@NotNull MyState state) {
        myState = state;
    }
    
    public boolean isAdhdModeEnabled() {
        return myState.adhdModeEnabled;
    }
    
    public void setAdhdModeEnabled(boolean enabled) {
        myState.adhdModeEnabled = enabled;
    }
    
    public boolean isShowStatusBar() {
        return myState.showStatusBar;
    }
    
    public void setShowStatusBar(boolean show) {
        myState.showStatusBar = show;
    }
}
