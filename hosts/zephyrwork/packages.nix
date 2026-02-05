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
    xmake
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
    kitty
    gnupg
    docker
    podman
    gzdoom
    neovim
    freecad
    godot_4
    simulide
    distrobox
    filezilla
    uhk-agent
    ghidra-bin
    gtkradiant
    android-tools
    xfce.mousepad
    unstable.slade
    unstable.rpi-imager
    unstable.zed-editor-fhs

    # 3D Printing
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

    # Archives
    zip
    unzip
    unrar

    # Communication
    nemo
    slack
    vesktop
    sunshine
    obsidian
    wasistlos
    ente-auth
    teamviewer
    figma-linux
    protonvpn-gui
    youtube-music
    github-desktop
    element-desktop
    teams-for-linux

    # Media
    feh
    mpv
    zbar
    gimp
    weasis
    ffmpeg
    shotcut
    blender
    wifi-qr
    vdhcoapp
    snapshot
    audacity
    darktable
    obs-studio
    caffeine-ng
    rawtherapee
    libresprite
    ns-usbloader
    google-chrome
    unstable.davinci-resolve

    # Games
    luanti
    zeroad
    yquake2
    ioquake3
    superTuxKart
    prismlauncher
    extremetuxracer
    pegasus-frontend
    trigger-unstable

    # VMs
    spice
    freerdp
    spice-gtk
    win-spice
    virtio-win
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
    ryubing
    gparted
    winetricks
    joystickwake
    unstable.xenia-canary
    wineWowPackages.stagingFull

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
    usbutils
    wireplumber
    libapparmor
    nodejs-slim_24
    lua-language-server

    # Wayland specific
    weston
    waydroid
    wdisplays
    wl-clipboard
    xwayland-satellite

    # Streaming
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi

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
