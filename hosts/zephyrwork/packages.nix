{ pkgs, inputs, unstable, ... }:

let
  v-analyzer = import ../../modules/nixos/packages/v-analyzer.nix { inherit pkgs; };
  xeventbind = import ../../modules/nixos/packages/xeventbind.nix { inherit pkgs; };
  wallpapers = import ../../modules/nixos/packages/wallpapers.nix { inherit pkgs; };
  zen-browser = inputs.zen-browser.packages."${pkgs.system}".default;
  fuckingnode = inputs.fuckingnode.packages."${pkgs.system}".default;
  nvim-config = inputs.nvim-config.packages."${pkgs.system}".default;
in
{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "freeimage-unstable-2021-11-01"
      "freeimage-3.18.0-unstable-2024-04-18"
    ];
    allowBroken = true;
  };

  nixpkgs.overlays = [
    (final: prev: {
      odin = import ../../modules/nixos/packages/odin.nix { pkgs = final; };
    })
  ];


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
    obsidian
    tuxguitar
    ente-auth
    riseup-vpn
    teamviewer
    figma-linux
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
    davinci-resolve

    # Games
    zeroad
    trigger
    minetest
    ioquake3
    superTuxKart
    prismlauncher
    extremetuxracer

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
    v-analyzer
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
    openssl
    wireplumber
    libapparmor
    nodejs-slim_24
    lua-language-server

    # Wayland specific
    weston
    waydroid
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
    rofi-wayland
    lxqt.lxqt-policykit
    haskellPackages.greenclip
    (flameshot.override { enableWlrSupport = true; })

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
