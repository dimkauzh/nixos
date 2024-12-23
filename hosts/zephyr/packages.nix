{ config, pkgs, inputs, ... }:

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
    lightdm-gtk-greeter

    # Development
    kitty
    slade
    neovim
    zed-editor
    ghidra-bin

    # Communication
    nemo
    vesktop
    ente-auth
    github-desktop
    whatsapp-for-linux
    element-desktop
    inputs.zen-browser.packages."${system}".specific

    # Media
    vlc
    gimp
    obs-studio
    darktable
    shotcut

    # Music
    spotify
    spicetify-cli

    # Games
    gzdoom
    zeroad
    urbanterror

    # Gaming Utilities
    mesa
    lutris
    winetricks
    prismlauncher
    wineWowPackages.stable

    # Office
    libreoffice
    zathura

    # Terminal
    zsh
    starship
    wakatime-cli

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
    thermald
    udisks2
    libnotify
    notify-osd
    lm_sensors
    libsecret
    pulseaudio
    pulsemixer
    xorg.xbacklight
    brightnessctl
    gnome-keyring
    (polybar.override {
      pulseSupport = true;
      i3Support = true;
    })

    # i3wm Utilities
    feh
    maim
    rofi
    xclip
    dunst
    arandr
    picom
    copyq
    flameshot
    playerctl
    xss-lock
    betterlockscreen
    lxqt.lxqt-policykit
    lxqt.lxqt-powermanagement

    # Networking and Connectivity
    blueman
    bluez
    bluez-tools
    networkmanagerapplet

    # Themes and Icons
    qt6ct
    lxappearance
    gruvbox-gtk-theme
    gruvbox-plus-icons
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

  fonts.packages = with pkgs; [
    # System Fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans

    # Coding Fonts
    nerd-fonts.comic-shanns-mono
  ];



}
