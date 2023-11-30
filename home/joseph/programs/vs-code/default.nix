{ config, pkgs, inputs, ... }:

{
  programs.vscode = {
    enable = true;
    userSettings = {
      window.menuBarVisibility = "toggle";
      editor = {
        fontFamily = "Fira Code";
      };
      workbench = {
        colorTheme = "Gruvbox Dark Hard";
        colorCustomizations = {
          "editor.background" = "#14161bff";
          "sideBar.background" = "#101015f9";
          "tab.activeBackground" = "#111319f1";
          "tab.inactiveBackground" = "#191b20a1";
          "editorLineNumber.activeForeground" = "#b3b4da";
          "editor.lineHighlightBackground" = "#192328";
          "statusBar.background" = "#090910d9";
          "activityBar.background" = "#090910d9";
          "input.background" = "#090910d9";
          "editorSuggestWidget.background" = "#111319f1";
          "sideBarSectionHeader.background" = "#090910d9";
          "sideBarSectionHeader.foreground" = "#fefefe";
          "list.activeSelectionBackground" = "#070709";
          "list.inactiveSelectionBackground" = "#070709";
          "tab.activeBorder" = "#bbbbcc";
          "list.focusBackground" = "#070709";
          "scrollbarSlider.hoverBackground" = "#090910d9";
          "scrollbarSlider.background" = "#111114ff";
          "scrollbarSlider.activeBackground" = "#070709";
          "editorGroupHeader.tabsBackground" = "#090910d9";
        };
      };
      explorer.confirmDragAndDrop = false;
      guides.enabled = false;
      editor.wordWrap = "on";
      window.titleBarStyle = "native";
      vim.insertModeKeyBindings = [
        {
          before = ["j" "k"];
          after = ["<Esc>"];
        }
      ];
      editor.codeLens = false;
      liveServer.settings.donotShowInfoMsg = true;
      editor.minimap.enabled = false;
      workbench.startupEditor = "none";
    };
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      golang.go
      ms-python.python
      vscodevim.vim
      eamodio.gitlens
    ];
    keybindings = [
      {
          key = "alt+h";
          command = "cursorLeft";
      }
      {
          key = "alt+j";
          command = "cursorDown";
      }
      {
          key = "alt+k";
          command = "cursorUp";
      }
      {
          key = "alt+l";
          command = "cursorRight";
      }
      {
          key = "alt+shift+h";
          command = "cursorLeftSelect";
      }
      {
          key = "alt+shift+j";
          command = "cursorDownSelect";
      }
      {
          key = "alt+shift+k";
          command = "cursorUpSelect";
      }
      {
          key = "alt+shift+l";
          command = "cursorRightSelect";
      }
      {
          key = "alt+u";
          command = "undo";
      }
      {
          key = "alt+shift+u";
          command = "redo";
      }
      {
          key = "shift+alt+a";
          command = "cursorLineEnd";
      }
      {
          key = "shift+alt+i";
          command = "-editor.action.insertCursorAtEndOfEachLineSelected";
          when = "editorTextFocus";
      }
      {
          key = "shift+alt+i";
          command = "cursorLineStart";
      }
      {
          key = "alt+w";
          command = "cursorWordEndRight";
      }
      {
          key = "alt+shift+w";
          command = "cursorWordEndRightSelect";
      }
      {
          key = "alt+b";
          command = "cursorWordStartLeft";
      }
      {
          key = "alt+shift+b";
          command = "cursorWordStartLeftSelect";
      }
      {
          key = "alt+x";
          command = "deleteRight";
      }
      {
          key = "alt+shift+x";
          command = "deleteLeft";
      }
      {
          key = "ctrl+k s";
          command = "-workbench.action.files.saveWithoutFormatting";
      }
      {
          key = "ctrl+k s";
          command = "workbench.action.files.saveAll";
      }
      {
          key = "ctrl+shift+r";
          command = "-workbench.action.quickOpenNavigatePreviousInRecentFilesPicker";
          when = "inQuickOpen && inRecentFilesPicker";
      }
      {
          key = "ctrl+shift+r";
          command = "-editor.action.refactor";
          when = "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly";
      }
      {
          key = "ctrl+shift+r";
          command = "-rerunSearchEditorSearch";
          when = "inSearchEditor";
      }
      {
          key = "ctrl+shift+r";
          command = "editor.action.goToReferences";
          when = "editorHasReferenceProvider && editorTextFocus && !inReferenceSearchEditor && !isInEmbeddedEditor";
      }
      {
          key = "shift+f12";
          command = "-editor.action.goToReferences";
          when = "editorHasReferenceProvider && editorTextFocus && !inReferenceSearchEditor && !isInEmbeddedEditor";
      }
      {
          key = "ctrl+shift+i";
          command = "editor.action.goToImplementation";
          when = "editorHasImplementationProvider && editorTextFocus && !isInEmbeddedEditor";
      }
      {
          key = "ctrl+f12";
          command = "-editor.action.goToImplementation";
          when = "editorHasImplementationProvider && editorTextFocus && !isInEmbeddedEditor";
      }
      {
          key = "ctrl+shift+i";
          command = "-workbench.action.toggleDevTools";
          when = "isDevelopment";
      }
      {
          key = "ctrl+shift+i";
          command = "-notebook.formatCell";
          when = "editorHasDocumentFormattingProvider && editorTextFocus && inCompositeEditor && notebookEditable && !editorReadonly && activeEditor == 'workbench.editor.notebook'";
      }
      {
          key = "ctrl+shift+i";
          command = "-editor.action.formatDocument";
          when = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
      }
      {
          key = "ctrl+shift+i";
          command = "-editor.action.formatDocument.none";
          when = "editorTextFocus && !editorHasDocumentFormattingProvider && !editorReadonly";
      }
      {
          key = "ctrl+shift+i";
          command = "-notebook.format";
          when = "notebookEditable && !editorTextFocus && activeEditor == 'workbench.editor.notebook'";
      }
      {
          key = "ctrl+h";
          command = "workbench.action.navigateBack";
          when = "canNavigateBack";
      }
      {
          key = "ctrl+h";
          command = "-editor.action.startFindReplaceAction";
          when = "editorFocus || editorIsOpen";
      }
      {
          key = "ctrl+h";
          command = "-extension.vim_ctrl+h";
          when = "editorTextFocus && vim.active && vim.use<C-h> && !inDebugRepl";
      }
      {
          key = "ctrl+l";
          command = "workbench.action.navigateForward";
          when = "canNavigateForward";
      }
      {
          key = "ctrl+l";
          command = "-expandLineSelection";
          when = "textInputFocus";
      }
      {
          key = "ctrl+l";
          command = "-extension.vim_navigateCtrlL";
          when = "editorTextFocus && vim.active && vim.use<C-l> && !inDebugRepl";
      }
      {
          key = "ctrl+l";
          command = "-notebook.centerActiveCell";
          when = "notebookEditorFocused";
      }
    ];
  };
}
