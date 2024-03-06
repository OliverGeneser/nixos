{
  config,
  pkgs,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  home-manager.users.olivergeneser = import ../../hosts/${config.networking.hostName}/home.nix;

  sops.secrets.olivergeneser-password = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };

  #users.mutableUsers = false;
  users.users.olivergeneser = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups =
      [
        "wheel"
        "video"
        "audio"
      ]
      ++ ifTheyExist [
        "networkmanager"
        "libvirtd"
        "kvm"
        "docker"
        "podman"
        "git"
        "network"
        "wireshark"
        "i2c"
        "tss"
        "plugdev"
      ];

    packages = [pkgs.home-manager];
  };

  programs.zsh.enable = true;
}
