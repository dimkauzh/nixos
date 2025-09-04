{ pkgs, unstable, ... }:

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
    btop
    dconf
    gnumake
    pkg-config

    # Window Manager
    i3
    lightdm
    xorg.xinit
    i3lock-color
    lightdm-gtk-greeter

    # Development
    tmux
    slade
    kitty
    gnupg
    docker
    podman
    gzdoom
    neovim
    leocad
    freecad
    godot_4
    simulide
    distrobox
    filezilla
    rpi-imager
    ghidra-bin
    gtkradiant
    kicad-small
    xfce.mousepad
    unstable.zed-editor

    # Programming
    go
    ols
    zls
    zig
    nil
    lua
    nixd
    odin
    vlang
    rustup

    # Archives
    unzip
    unrar

    # Communication
    nemo
    xpad
    slack
    halloy
    spotube
    vesktop
    sunshine
    obsidian
    tuxguitar
    ente-auth
    riseup-vpn
    teamviewer
    figma-linux
    moonlight-qt
    protonvpn-gui
    youtube-music
    cinny-desktop
    github-desktop
    element-desktop
    whatsapp-for-linux

    # Media
    vlc
    feh
    zbar
    gimp
    lmms
    weasis
    zenity
    shotcut
    blender
    wifi-qr
    snapshot
    audacity
    darktable
    obs-studio
    caffeine-ng
    rawtherapee
    libresprite
    ns-usbloader
    google-chrome
    davinci-resolve

    # Games
    zeroad
    trigger
    yquake2
    minetest
    ioquake3
    superTuxKart
    prismlauncher
    extremetuxracer
    pegasus-frontend

    # VMs
    spice
    spice-gtk
    win-spice
    win-virtio
    virt-viewer
    gnome-boxes
    virt-manager
    virglrenderer
    spice-protocol

    # Emulation and Tools
    mgba
    dxvk
    ruffle
    lutris
    heroic
    ryujinx
    gparted
    winetricks
    joystickwake
    unstable.xenia-canary
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
    v-analyzer
    xeventbind
    zen-browser
    fuckingnode
    nvim-config
    mantablockscreen

    # Dependencies
    jdk
    iwd
    clang
    ripgrep
    flatpak
    openssl
    wireplumber
    libapparmor
    nodejs-slim_24
    lua-language-server

    # Wayland specific
    weston
    waydroid
    wl-clipboard
    xwayland-satellite

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
    xsecurelock
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
    aria
    acpi
    gtk3
    gtk4
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

    # i3wm Utilities
    rofi
    xclip
    scrot
    arandr
    picom
    playerctl
    xss-lock
    xidlehook
    xsettingsd
    lxqt.lxqt-policykit
    haskellPackages.greenclip
    (flameshot.override { enableWlrSupport = true; })

    # Niri/Wayland Utilities
    rofi-wayland
    
    # OBS packages
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-vaapi
        obs-gstreamer
        obs-vkcapture
      ];
    })

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
  ];
}
