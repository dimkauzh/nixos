{ ... }:

{
  imports =
    [
      ./programs/spicetify.nix
      ./programs/xss.nix
      ./programs/appimage.nix

      ./services/fonts.nix
      ./services/x.nix
      ./services/others.nix
    ];
}
