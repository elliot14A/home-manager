{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins/style.nix
    ./plugins/completion.nix
    ./plugins/lsp.nix
    ./plugins/editor.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";
  };
}
