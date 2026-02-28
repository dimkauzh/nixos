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
    floorp-bin
    protonvpn-gui
    github-desktop
    element-desktop
    unstable.karere

    # Media
    vlc
    feh
    gimp
    zbar
    shotcut
    darktable
    obs-studio
    caffeine-ng
    youtube-music

    # Games/Emulation and Tools
    mgba
    mesa
    dxvk
    steam
    lutris
    winetricks
    joystickwake
    prismlauncher
    unstable.wineWowPackages.stagingFull

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
    xeventbind
    nvim-config
    # zen-browser stupid window-sync, why zen, WHY :(

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
    xorg.xbacklight
    xwayland-satellite

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
  ];
}
