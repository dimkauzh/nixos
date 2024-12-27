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
    zed-editor
    ghidra-bin

    # Communication
    nemo
    halloy
    vesktop
    whatsie
    ente-auth
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

    # Music
    spotify
    spicetify-cli

    # Gaming Utilities
    mesa
    lutris
    winetricks
    joystickwake
    vulkan-tools
    prismlauncher
    wineWowPackages.stable
    dxvk

    # Office
    libreoffice
    zathura

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
    zen-browser
    mantablockscreen
    gruvboxPlusIcons

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
    betterlockscreen
    lxqt.lxqt-policykit

    # Networking and Connectivity
    blueman
    bluez
    bluez-tools
    networkmanagerapplet

    # Themes and Icons
    qt6ct
    lxappearance
    gruvbox-gtk-theme
    capitaine-cursors

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
