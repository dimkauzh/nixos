{ config, pkgs, inputs, ... }:

{

  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
  ];

  environment.systemPackages = with pkgs; [
    git
    wget
    dconf
    wget
    unzip

    home-manager
    i3
    lightdm
    lightdm-gtk-greeter

    kitty
    zed-editor

    inputs.zen-browser.packages."${system}".specific
    vesktop
    ente-auth
    element-desktop
    github-desktop
    whatsapp-for-linux
    nemo

    slade
    ghidra-bin

    gzdoom
    zeroad
    urbanterror

    udevil
    gvfs
    udisks2

    mesa
    lutris
    winetricks
    prismlauncher
    wineWowPackages.stable

    zsh
    starship
    wakatime-cli

    atk
    gtk3
    gtk4
    gnome-keyring
    libsecret

    lm_sensors
    notify-osd
    libnotify
    brightnessctl
    pulseaudio
    pulsemixer
    xorg.xbacklight

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
    arandr
    xclip
    copyq

    (polybar.override {
      pulseSupport = true;
      i3Support = true;
    })

    thermald
    tlp

    blueman
    bluez
    bluez-tools
    networkmanagerapplet

    dex
    acpi
    upower
    xss-lock
    betterlockscreen

    gruvbox-gtk-theme
    gruvbox-plus-icons
    capitaine-cursors
    lxappearance
    qt6ct

    (let base = pkgs.appimageTools.defaultFhsEnvArgs; in
      pkgs.buildFHSEnv (base // {
      name = "fhs";
      targetPkgs = pkgs:
        (base.targetPkgs pkgs) ++ (with pkgs; [
          pkg-config
          ncurses
        ]
      );
      profile = "export FHS=1";
      runScript = "bash";
      extraOutputsToInstall = ["dev"];
    }))
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.comic-shanns-mono
  ];
}
