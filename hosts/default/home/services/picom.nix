{ lib, config, ... }:

{
  services.picom = {
    enable = true;

    backend = "glx";
    vSync = true;

    fade = true;
    fadeSteps = [ 0.1 0.1 ];

    settings = {
      corner-radius = 15;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      detect-transient = true;
      use-damage = true;

    };

    wintypes = {
      dock = { shadow = false; corner-radius = 0; };
      fullscreen = { shadow = false; corner-radius = 0; };
      notification = { shadow = false; corner-radius = 0; };
    };

    extraArgs = [
      "--window-shader-fg=${config.xdg.configFile."picom/rounded-borders.glsl".target}"
    ];
  };

  xdg.configFile = {
    "picom/picom.conf".text = lib.mkAfter ''
      rules = (
        {
          match = "class_g = 'Polybar'";
          shadow = false;
          corner-radius = 0;
        },
        {
          match = "class_g = 'Dunst'";
          shadow = false;
          corner-radius = 0;
        },
        {
          match = "fullscreen";
          shadow = false;
          corner-radius = 0;
        }
      );

      animations = (
      {
        triggers = [
          "open",
          "show",
        ];

        preset = "appear";
        duration = "1";
      },
      {
        triggers = [
          "close",
          "hide",
        ];

        preset = "disappear";
        duration = "1";
      },
      {
        triggers = [
          "geometry"
        ];

        preset = "geometry-change";
        duration = "1";
      })
    '';

    "picom/rounded-borders.glsl".text = ''
      #version 330

      in vec2 texcoord;
      uniform sampler2D tex;
      uniform float corner_radius;

      vec4 default_post_processing(vec4 c);

      vec4 add_rounded_corners(
          vec4 win_color,
          vec2 tex_coord,
          vec2 tex_size,
          float radius,
          float thickness)
      {
          // If we're far from corners, we just pass window texels through
          vec2 corner_distance = min(abs(tex_coord), abs(tex_size - 1 - tex_coord));
          if (any(greaterThan(corner_distance, vec2(radius))))
              return win_color;

          // Distance from the closest arc center
          vec2 center_distance = min(
              abs(vec2(radius) - tex_coord),
              abs(vec2(tex_size - radius) - tex_coord));

          // Do some simple anti-aliasing
          float inner_radius = radius - thickness;
          float feather = 1 / inner_radius;
          float r = length(center_distance) / inner_radius;
          float blend = smoothstep(1, 1 + feather, r);

          vec4 border_color = texture2D(tex, vec2(0), 0);
          return blend * border_color + (1.0 - blend) * win_color;
      }

      vec4 window_shader()
      {
          vec2 tex_size = textureSize(tex, 0);
          vec4 c = texture2D(tex, texcoord / tex_size, 0);
          vec4 with_corners = add_rounded_corners(c, texcoord, tex_size, corner_radius, 2);
          return default_post_processing(with_corners);
      }
    '';
  };
}
