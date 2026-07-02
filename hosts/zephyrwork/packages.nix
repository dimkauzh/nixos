{ pkgs, unstable, ... }:

{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "freeimage-unstable-2021-11-01"
      "freeimage-3.18.0-unstable-2024-04-18"
      "pnpm-10.29.2"
    ];
    allowBroken = true;
  };

  environment.systemPackages = with pkgs; [
    # Essentials
    git
    gcc
    wget
    btop
    xmake
    dconf
    gnumake
    pkg-config

    # Development
    kitty
    gnupg
    slade
    docker
    podman
    gzdoom
    neovim
    godot_4
    mousepad
    distrobox
    filezilla
    uhk-agent
    ghidra-bin
    rpi-imager
    android-tools

    # 3D Printing
    freecad
    orca-slicer

    # Programming
    go
    ols
    zls
    zig
    nil
    lua
    nixd
    odin
    lua-language-server

    # Archives
    zip
    unzip
    unrar
    extract-xiso

    # Communication
    nemo
    slack
    kopuz
    zapzap
    vesktop
    obsidian
    ente-auth
    teamviewer
    proton-vpn
    pear-desktop
    github-desktop
    element-desktop
    teams-for-linux

    # Media
    zbar
    weasis
    ffmpeg
    blender
    wifi-qr
    audacity
    caffeine-ng
    libresprite
    ns-usbloader
    google-chrome

    # Pictures / Video
    vlc
    mpv
    gimp
    loupe
    shotcut
    digikam
    rawtherapee
    unstable.darktable
    unstable.davinci-resolve

    # Games
    zeroad
    luanti
    yquake2
    ioquake3
    gamemode
    supertuxkart
    prismlauncher
    extremetuxracer
    trigger-unstable

    # VMs
    spice
    winapps
    freerdp
    spice-gtk
    win-spice
    virtio-win
    virt-viewer
    gnome-boxes
    virt-manager
    virglrenderer
    spice-protocol
    winapps-launcher

    # Emulation and Tools
    mgba
    dxvk
    ruffle
    lutris
    melonds
    gparted
    joystickwake
    unstable.winetricks
    unstable.xenia-canary
    unstable.wineWow64Packages.stagingFull

    # Office
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
    fuckingnode
    nvim-config

    # Dependencies
    yad
    jdk
    clang
    ripgrep
    flatpak
    openssl
    usbutils
    wireplumber
    libapparmor
    nodejs-slim_24

    # Wayland specific
    weston
    waydroid
    wdisplays
    wl-clipboard
    waydroid-helper
    xwayland-satellite

    # Streaming
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly

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

    # System Utilities
    atk
    dex
    acpi
    gtk3
    gtk4
    aria2
    avahi
    direnv
    screen
    nix-direnv
    door-knocker

    # Gnome Utilities
    polkit_gnome
    gnome-clocks
    gnome-firmware
    gnome-calendar
    gnome-calculator
    gnome-disk-utility
    gnome-system-monitor
    gnome-network-displays

    # WM Utilities
    rofi
    flameshot
    playerctl
    
    # Storage Utilities
    tokei
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
