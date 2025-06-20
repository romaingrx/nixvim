{ lib, config, pkgs, ... }: {
  options = { copilot.enable = lib.mkEnableOption "Enable copilot module"; };
  config = lib.mkIf config.copilot.enable {
    plugins.copilot-lua = {
      enable = true;
      nodePackage = pkgs.nodejs_22;
      panel = {
        enabled = false;
        autoRefresh = true;
        keymap = {
          jumpPrev = "[[";
          jumpNext = "]]";
          accept = "<CR>";
          refresh = "gr";
          open = "<M-CR>";
        };
        layout = {
          position = "bottom"; # | top | left | right
          ratio = 0.4;
        };
      };
      suggestion = {
        enabled = false;
        autoTrigger = true;
        debounce = 75;
        keymap = {
          accept = "<M-l>";
          acceptWord = false;
          acceptLine = false;
          next = "<M-]>";
          prev = "<M-[>";
          dismiss = "<C-]>";
        };
      };
      filetypes = {
        yaml = false;
        markdown = false;
        help = false;
        gitcommit = false;
        gitrebase = false;
        hgcommit = false;
        svn = false;
        cvs = false;
        "." = false;
      };
      copilotNodeCommand =
        "${pkgs.nodejs_22}/bin/node"; # Use Node.js 22.x instead of default 18.x
      serverOptsOverrides = { };
    };
  };
}
