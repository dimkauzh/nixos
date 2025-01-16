{ config, pkgs, inputs, ... }:

let
  mantablockscreen = import ./packages/mantablockscreen.nix { inherit pkgs; };
  xeventbind = import ./packages/xeventbind.nix { inherit pkgs; };
  powerkit = import ./packages/powerkit.nix { inherit pkgs; };
  wallpapers = import ./packages/wallpapers.nix { inherit pkgs; };
  nvim-config = import ./packages/neovim.nix { inherit pkgs; };
  zen-browser = inputs.zen-browser.packages."${pkgs.system}".default;
in
{
  # Allow insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
  ];

  environment.systemPackages = with pkgs; [
    # Essentials
    git
    gcc
    wget
    dconf
    unzip

    # Window Manager
    i3
    lightdm
    i3lock-color
    lightdm-gtk-greeter

    # Development
    kitty
    slade
    gzdoom
    neovim
    filezilla
    zed-editor

    # Communication
    nemo
    zapzap
    vesktop
    ente-auth
    protonvpn-gui
    github-desktop

    # Media
    vlc
    gimp
    zbar
    obs-studio
    darktable
    shotcut

    # Games/Emulation and Tools
    mgba
    mesa
    dxvk
    lutris
    winetricks
    joystickwake
    prismlauncher
    wineWowPackages.stable

    # Office
    zathura
    libreoffice

    # Terminal
    zsh
    starship
    wakatime-cli

    # Ricing
    pipes
    nitch
    cbonsai
    nerdfetch

    # Custom Package
    powerkit
    wallpapers
    xeventbind
    zen-browser
    nvim-config
    mantablockscreen

    # Dependencies
    jdk
    flatpak
    nodejs-slim_23

    # System Utilities
    atk
    dex
    tlp
    acpi
    gtk3
    gtk4
    avahi
    upower
    udevil
    direnv
    udisks2
    thermald
    libnotify
    nix-direnv
    notify-osd
    lm_sensors
    libsecret
    pulseaudio
    pulsemixer
    pwvucontrol
    xorg.xbacklight
    brightnessctl
    gnome-keyring

    # Gnome Utilities
    gnome-firmware
    gnome-calculator
    gnome-disk-utility
    gnome-system-monitor

    # i3wm Utilities
    feh
    rofi
    xclip
    dunst
    scrot
    arandr
    picom
    flameshot
    playerctl
    xss-lock
    xsettingsd
    lxqt.lxqt-policykit
    haskellPackages.greenclip

    # Storage Utilities
    baobab
    timeshift
    xarchiver

    # Networking and Connectivity
    blueman
    bluez
    bluez-tools
    networkmanagerapplet

    # Themes and Icons
    lxappearance

    # Running Binaries
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
}
