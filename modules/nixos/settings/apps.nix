{ ... }:

{
  imports =
    [
      ./programs/spicetify.nix
      ./programs/xss.nix

      ./services/fonts.nix
      ./services/x.nix
      ./services/others.nix
    ];
}
