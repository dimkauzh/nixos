{ ... }:

{
  services.picom = {
    enable = true;

    backend = "glx";
    vSync = true;

    fade = true;
    fadeSteps = [ 0.1 0.1 ];

    settings = {
      corner-radius = 15;

      animations = [
        {
          triggers = [ "open", "show" ];
          preset = "appear";
          duration = "1";
        }
        {
          triggers = [ "close", "hide" ];
          preset = "disappear";
          duration = "1";
        }
        {
          triggers = [ "geometry" ];
          preset = "geometry-change";
          duration = "1";
        }
      ];
    };

    extraArgs = [
      "--window-shader-fg=${home.homeDirectory}/.config/picom/rounded-borders.glsl"
    ];
  };
}
