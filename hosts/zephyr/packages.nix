{ config, pkgs, inputs, ... }:

let
  mantablockscreen = import ./packages/mantablockscreen.nix { inherit pkgs; };
  xeventbind = import ./packages/xeventbind.nix { inherit pkgs; };
  powerkit = import ./packages/powerkit.nix { inherit pkgs; };
  zen-browser = import ./packages/zen.nix { inherit pkgs; };
  gruvboxPlusIcons = import ./packages/gruvbox-icons.nix { inherit pkgs; };
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
    ghidra-bin

    # Communication
    nemo
    halloy
    zapzap
    vesktop
    ente-auth
    wireguard-ui
    protonvpn-gui
    github-desktop
    element-desktop

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
    vulkan-tools
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
    xeventbind
    mantablockscreen
    gruvboxPlusIcons
    inputs.zen-browser.packages."${system}".default

    # Dependencies
    jdk
    nodejs-slim_23

    # System Utilities
    atk
    dex
    tlp
    acpi
    gvfs
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
    (polybar.override {
      pulseSupport = true;
      i3Support = true;
    })

    # Gnome Utilities
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
    copyq
    flameshot
    playerctl
    xss-lock
    xsettingsd
    lxqt.lxqt-policykit

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
    qt6ct
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
