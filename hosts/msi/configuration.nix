{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.framework-13-7040-amd
    ./hardware-configuration.nix
    ./disks.nix

    ../../nixos
    ../../nixos/users/olivergeneser.nix
  ];

  networking = {
    hostName = "msi";
  };

  modules.nixos = {
    avahi.enable = true;
    auto-hibernate.enable = false;
    bluetooth.enable = true;
    docker.enable = true;
    gaming.enable = true;
    login.enable = true;
    extraSecurity.enable = true;
    power.enable = true;
    virtualisation.enable = true;
  };

  swapDevices = [{device = "/swap/swapfile";}];
  boot = {
    kernelParams = [
      "resume_offset=533760"
    ];
    blacklistedKernelModules = ["hid-sensor-hub"];
    supportedFilesystems = lib.mkForce ["btrfs"];
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    resumeDevice = "/dev/disk/by-label/nixos";
    # lanzaboote = {
    #   enable = true;
    #   pkiBundle = "/etc/secureboot";
    # };
  };

  boot.plymouth = {
    enable = true;
    themePackages = [(pkgs.catppuccin-plymouth.override {variant = "mocha";})];
    theme = "catppuccin-mocha";
  };
  boot.initrd.systemd.enable = true;

  system.stateVersion = "23.11";
}
