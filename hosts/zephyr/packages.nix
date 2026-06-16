{ unstable, pkgs, ... }:

{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "freeimage-unstable-2021-11-01"
      "freeimage-3.18.0-unstable-2024-04-18"
    ];
    allowBroken = true;
  };

  environment.systemPackages = with pkgs; [
    # Essentials
    git
    gcc
    wget
    dconf
    unzip

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
    proton-vpn
    floorp-bin
    github-desktop
    element-desktop
    unstable.zapzap

    # Media
    vlc
    gimp
    zbar
    loupe
    shotcut
    obs-studio
    rawtherapee
    caffeine-ng
    pear-desktop

    # Games/Emulation and Tools
    mgba
    mesa
    dxvk
    steam
    joystickwake
    prismlauncher
    unstable.winetricks
    unstable.wineWow64Packages.stagingFull

    # Office
    libreoffice

    # Terminal
    zsh
    starship
    wakatime-cli

    # Wayland specific
    weston
    waydroid
    wdisplays
    wl-clipboard
    waydroid-helper
    xwayland-satellite

    # Ricing
    pipes
    nitch
    cbonsai
    nerdfetch

    # Custom Package
    nvim-config

    # Dependencies
    jdk
    nixd
    flatpak
    ripgrep
    nodejs-slim_24

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
    flameshot
    playerctl

    # Storage Utilities
    baobab
    timeshift
    xarchiver

    # Networking and Connectivity
    bluez
    blueman
    bluez-tools
    networkmanagerapplet

    # Themes and Icons
    lxappearance
    capitaine-cursors

    # XDG stuff
    xdg-desktop-portal
  ];
}
