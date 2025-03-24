{ ... }:

{
  programs.niri = {
    enable = true;
    settings = {
      outputs."eDP-1" = {
        scale = 1.0;
      };

      binds = {
        "Super+Space".action.spawn = "kitty";
      };
    };
  };
}
