{ pkgs, inputs, ... }:

let
  xeventbind = import ../default/nixos/packages/xeventbind.nix { inherit pkgs; };
  wallpapers = import ../default/nixos/packages/wallpapers.nix { inherit pkgs; };
  nvim-config = import ../default/nixos/packages/neovim.nix { inherit pkgs; };
  zen-browser = inputs.zen-browser.packages."${pkgs.system}".default;
  fuckingnode = inputs.fuckingnode.packages."${pkgs.system}".default;
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
    btop
    dconf

    # Window Manager
    i3
    lightdm
    i3lock-color
    lightdm-gtk-greeter

    # Development
    kitty
    slade
    docker
    gzdoom
    neovim
    leocad
    freecad
    godot_4
    simulide
    filezilla
    rpi-imager
    ghidra-bin
    gtkradiant
    xfce.mousepad


    # Programming
    go
    nil
    lua
    nixd

    # Archives
    unzip
    unrar

    # Communication
    nemo
    xpad
    slack
    zapzap
    halloy
    spotube
    vesktop
    obsidian
    tuxguitar
    ente-auth
    riseup-vpn
    figma-linux
    protonvpn-gui
    youtube-music
    cinny-desktop
    github-desktop
    element-desktop

    # Media
    vlc
    feh
    zbar
    gimp
    lmms
    shotcut
    blender
    snapshot
    audacity
    darktable
    obs-studio
    caffeine-ng
    rawtherapee
    libresprite

    # Games
    zeroad
    minetest
    ioquake3
    superTuxKart
    prismlauncher
    extremetuxracer

    # Emulation and Tools
    mgba
    mesa
    dxvk
    lutris
    winetricks
    joystickwake
    wineWowPackages.stable

    # Office
    zathura
    libreoffice

    # Terminal
    zsh
    lazygit
    starship
    wakatime-cli

    # Ricing
    pipes
    nitch
    cbonsai
    nerdfetch
    fastfetch

    # Custom Package
    wallpapers
    xeventbind
    zen-browser
    fuckingnode
    nvim-config

    # Dependencies
    jdk
    iwd
    clang
    ripgrep
    flatpak
    libapparmor
    nodejs-slim_23

    # System Audio
    pulseaudio
    pulsemixer
    pwvucontrol

    # System Power
    upower
    thermald
    batsignal
    fw-ectool
    geekbench
    lm_sensors
    auto-cpufreq

    # System Security
    fprintd
    libsecret
    gnome-keyring

    # System Messages
    dunst
    libnotify
    notify-osd

    # System Storage
    udevil
    udisks2

    # System Display
    brightnessctl
    xorg.xbacklight

    # System Utilities
    atk
    dex
    acpi
    gtk3
    gtk4
    avahi
    direnv
    nix-direnv

    # Gnome Utilities
    polkit_gnome
    gnome-clocks
    gnome-firmware
    gnome-calendar
    gnome-calculator
    gnome-disk-utility
    gnome-system-monitor
    gnome-network-displays

    # i3wm Utilities
    rofi
    xclip
    scrot
    arandr
    picom
    flameshot
    playerctl
    xss-lock
    xidlehook
    xsettingsd
    lxqt.lxqt-policykit
    haskellPackages.greenclip

    # Storage Utilities
    tokei
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
    capitaine-cursors

    # XDG stuff
    xdg-desktop-portal
    xdg-desktop-portal-gtk

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
