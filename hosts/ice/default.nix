{ config, pkgs, outputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
    
  system.stateVersion = "23.05";

  networking.hostName = "ice";
  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Melbourne";
  
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    pulse.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };

  nix = {
    package = pkgs.nixFlakes;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    SCREENSHOT_DIR = "/media/winarch-shared/screenshots/";
  };

  users.users.joseph = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "uinput" ];
    packages = with pkgs; [
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGNlFlNSbKZpHABOYwbj5peuGvK7c6ywZ+WE7RA/sBeY joseph@eeeeee"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkTGykM7sMbxx5MKovPws2OpKYsQuFHq0OBNTiTCOb3ulOMcfnOQfrp6/GCl/X7OajP2FvvwnH4YjD3sCNlcbmMdNSSUhHAI4lMwDcPkq2tBmTqoAW8W+zTOkFhziJijwbmRvlrrl+VL3C5fceTTOyKA97MjOCBoVBhsF89n4KP6Y6MQC2KoqotkhJI8pVENJMS095mNXtEhvIe2hU5BEYHLTXZ4o6R72iRoLc3VU1/VznT8FrnSE3VO578u/QuBT9dvVyySTe3dTIBEondBVoZV2Tj2r0XCvwxpvio9Yb1Q9bl5ugcv7LpuzzLSzq70cySYYDuDZYgJIPOvb2TqzFcEaIuHV35eKmqBvYN3BBkU444sR70ANtt8kz8tpqJo3Ou4kLn19AAFYXs7PN6soUgCDvm0R1Zz4tPf5beAeQW0iAKSm0zNNcqTjkwNz8G5LmIvSawXlP3PfFQzkSlYJfRxVV/KR4dg9/fDQeFQoBCxHo63EBUw4SivgUtK1Fby0= u0_a341@localhost"
    ];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  
  nixpkgs = {
    config.allowUnfreePredicate = _: true;
    overlays = [
      outputs.overlays.stable
    ];
  };
  environment.systemPackages = with pkgs; pkgs.lib.lists.flatten [
    home-manager
    firefox
    bitwarden
    discord
    telegram-desktop
    chromium

    wget
    curl
    file
    ripgrep
    ripgrep-all
    fd
    bat
    eza
    jq
    wev
    wlrctl
    httpie
    aria
    dig
    dogdns

    vim
    neovim
    git
    zsh
    kitty
    alacritty
    foot

    swayimg
    imv
    imagemagick

    hyprpaper
    wl-clipboard
    wlr-randr
    libnotify

    (let
      python-pkgs = ps: with ps; [
        pycryptodome
        tqdm
        gmpy2
        requests
        numpy
      ];
    in
    [
      (python3.withPackages(python-pkgs))
      stable.pypy3
      (sage.override {
        requireSageTests = false;
        extraPythonPackages = python-pkgs;
      })
    ])
  ];

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.ssh.startAgent = true;
  services.tailscale.enable = true;
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  fonts.packages = with pkgs; [
    powerline-fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    meslo-lgs-nf
    font-awesome
    twitter-color-emoji
  ];
}
