{ config, pkgs, system, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    i3
    lightdm
    lightdm-gtk-greeter
    kitty
    inputs.zen-browser.packages."${system}".specific
    rofi
    firefox
  ];
}
