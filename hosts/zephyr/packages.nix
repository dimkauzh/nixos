{ pkgs, inputs, ... }:

let
  xeventbind = import ../../modules/nixos/packages/xeventbind.nix { inherit pkgs; };
  wallpapers = import ../../modules/nixos/packages/wallpapers.nix { inherit pkgs; };
  nvim-config = import ../../modules/nixos/packages/neovim.nix { inherit pkgs; };
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
    vesktop
    ente-auth
    protonvpn-gui
    github-desktop
    whatsapp-for-linux

    # Media
    vlc
    feh
    gimp
    zbar
    shotcut
    darktable
    obs-studio
    caffeine-ng

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
    wallpapers
    xeventbind
    zen-browser
    nvim-config

    # Dependencies
    jdk
    flatpak
    nodejs-slim_23

    # System Audio
    pulseaudio
    pulsemixer
    pwvucontrol

    # System Power
    tlp
    upower
    thermald
    batsignal
    lm_sensors

    # System Security
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
    gnome-firmware
    gnome-calculator
    gnome-disk-utility
    gnome-system-monitor

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
