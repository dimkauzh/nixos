{ pkgs, ... }:

let
  natsumiSrc = pkgs.fetchFromGitHub {
    owner = "greeeen-dev";
    repo = "natsumi-browser";
    rev = "v6.1.3";
    hash = "sha256-Jsqx0AhS0NkhJlfL0DX2YSvcdFNqx/sRrIQw53sj6Tg=";
  };

  floorpProfile = "default";
in
{
  programs.floorp = {
    enable = true;
    
    profiles.${floorpProfile} = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        
        "browser.uidensity" = 0;
        "svg.context-properties.content.enabled" = true;
      };
    };
  };

  home.file = {
    ".floorp/${floorpProfile}/chrome/natsumi" = {
      source = "${natsumiSrc}/natsumi";
      recursive = true;
    };
    ".floorp/${floorpProfile}/chrome/userChrome.css".source = "${natsumiSrc}/userChrome.css";
    ".floorp/${floorpProfile}/chrome/userContent.css".source = "${natsumiSrc}/userContent.css";
    ".floorp/${floorpProfile}/chrome/natsumi-config.css".source = "${natsumiSrc}/natsumi-config.css";
  };
}
