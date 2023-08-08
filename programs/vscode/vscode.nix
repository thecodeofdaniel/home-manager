{ pkgs, ... }:

{
  enable = true;

  extensions = with pkgs.vscode-extensions; [
    # # C/C++
    # ms-vscode.cpptools

    # # JUPYTER NOTEBOOK
    # ms-toolsai.jupyter
    # ms-toolsai.vscode-jupyter-cell-tags
    # ms-toolsai.jupyter-keymap
    # ms-toolsai.jupyter-renderers
    # ms-toolsai.vscode-jupyter-slideshow

    # MATERIAL ICON THEME
    pkief.material-icon-theme

    # NIX LANGUAGE SUPPORT
    bbenoist.nix # this doesn't install the damn thing

    # PRETTIER
    esbenp.prettier-vscode

    # PYTHON
    ms-python.vscode-pylance
    ms-python.python

  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    # # TABOUT (id: albert.TabOut)
    {
      name = "TabOut";
      publisher = "albert";
      version = "0.2.2";
      sha256 = "1iprf6qad42h3f47idlmlf9vzhmi26yj44mj3gd56l14fc03lzdk";
    }
  ];

  userSettings = {
    "[css][html][nix][scss]" = { "editor.tabSize" = 2; };
    "[css][html][scss]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
    "editor.minimap.enabled" = false;
    "editor.rulers" = [80 100];
    "explorer.confirmDelete" = false;
    "explorer.confirmDragAndDrop" = false;
    "files.autoSave" = "afterDelay";
    "files.autoSaveDelay" = 1000;
    "terminal.integrated.inheritEnv" = false;
    "workbench.iconTheme" = "material-icon-theme";
    "leetcode.workspaceFolder" = "/home/user/Desktop/LeetCode";
    "leetcode.defaultLanguage" = "python3";
  };

  keybindings = [
    {
      key = "ctrl+k";
      command = "editor.action.trimTrailingWhitespace";
      when = "editorTextFocus && !editorReadonly";
    }
    {
      key = "ctrl+w";
      command = "workbench.action.terminal.kill";
    }
    {
      key = "shift+alt+p";
      command = "python.execInTerminal";
    }
    {
      key = "ctrl+e";
      command = "workbench.action.toggleEditorWidths";
    }
    {
      key = "ctrl+alt+b";
      command = "workbench.action.toggleActivityBarVisibility";
    }
  ];
}
