{ config, pkgs, lib, ... }:

let
  toRasi = attrs:
    builtins.concatStringsSep "\n" (map (name: ''
      ${name} = {
      ${builtins.concatStringsSep "\n" (map (key: "  ${key} = ${builtins.toJSON attrs.${name}.${key}};") (builtins.attrNames attrs.${name}))}
      };
    '') (builtins.attrNames attrs));

  myTheme = {
    window = {
      background-color = "@background";
      border = 2;
      padding = 2;
    };

    mainbox = {
      border = 0;
      padding = 0;
    };

    message = {
      border = "2px 0 0";
      border-color = "@separatorcolor";
      padding = 1;
    };

    textbox = {
      highlight = "@highlight";
      text-color = "@foreground";
    };

    listview = {
      border = "2px solid 0 0";
      padding = "2px 0 0";
      border-color = "@separatorcolor";
      spacing = 2;
      scrollbar = "@scrollbar";
    };

    element = {
      border = 0;
      padding = 2;

      normal = {
        normal = {
          background-color = "@normal-background";
          text-color = "@normal-foreground";
        };

        urgent = {
          background-color = "@urgent-background";
          text-color = "@urgent-foreground";
        };

        active = {
          background-color = "@active-background";
          text-color = "@active-foreground";
        };
      };

      selected = {
        normal = {
          background-color = "@selected-normal-background";
          text-color = "@selected-normal-foreground";
        };

        urgent = {
          background-color = "@selected-urgent-background";
          text-color = "@selected-urgent-foreground";
        };

        active = {
          background-color = "@selected-active-background";
          text-color = "@selected-active-foreground";
        };
      };

      alternate = {
        normal = {
          background-color = "@alternate-normal-background";
          text-color = "@alternate-normal-foreground";
        };

        urgent = {
          background-color = "@alternate-urgent-background";
          text-color = "@alternate-urgent-foreground";
        };

        active = {
          background-color = "@alternate-active-background";
          text-color = "@alternate-active-foreground";
        };
      };
    };

    scrollbar = {
      width = 4;
      border = 0;
      handle-color = "@scrollbar-handle";
      handle-width = 8;
      padding = 0;
    };

    sidebar = {
      border = "2px 0 0";
      border-color = "@separatorcolor";
    };

    inputbar = {
      spacing = 0;
      text-color = "@normal-foreground";
      padding = 2;
      children = [ "prompt" "textbox-prompt-sep" "entry" "case-indicator" ];
    };

    case-indicator = {
      spacing = 0;
      text-color = "@normal-foreground";
    };

    entry = {
      spacing = 0;
      text-color = "@normal-foreground";
    };

    prompt = {
      spacing = 0;
      text-color = "@normal-foreground";
    };

    button = {
      spacing = 0;
      text-color = "@normal-foreground";

      selected = {
        background-color = "@selected-normal-background";
        text-color = "@selected-normal-foreground";
      };
    };

    textbox-prompt-sep = {
      expand = false;
      str = ":";
      text-color = "@normal-foreground";
      margin = "0 0.3em 0 0";
    };
  };
in
{
  programs.rofi = {
    enable = true;
    font = "Noto Sans 14";
    terminal = "${pkgs.kitty}/bin/kitty";

    theme = toRasi myTheme;

    extraConfig = {
      show-icons = true;
      icon-theme = "Gruvbox-Plus-Dark";
    };
  };
}
