{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    gcc
    git

    home-manager
    i3
    lightdm
    lightdm-gtk-greeter

    kitty
    zed-editor

    inputs.zen-browser.packages."${system}".specific
    vesktop

    rofi
    playerctl
    flameshot
    maim
    feh
    dunst
    picom
    lxqt.lxqt-powermanagement
    lxqt.lxqt-policykit
    xsettingsd
    xclip
    copyq
    blueman
    lm_sensors
    notify-osd
    libnotify
    brightnessctl
    pulseaudio
    pulsemixer
    xorg.xbacklight
    (polybar.override {
      pulseSupport = true;
      i3Support = true;
    })

    thermald
    tlp
  ];
}
