{ config, pkgs, outputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
    
  system.stateVersion = "23.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
  };

  users.users.joseph = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    packages = with pkgs; [
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
    vim
    neovim
    bitwarden
    discord
    telegram-desktop
    wget
    curl
    firefox
    chromium
    file
    git
    zsh
    kitty
    alacritty
    foot
    hyprpaper
    imagemagick
    ripgrep
    ripgrep-all
    wl-clipboard
    wlr-randr
    fd
    bat
    eza
    jq
    httpie
    aria
    dig
    dogdns
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
