{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ../../home-manager
    ../../home-manager/programs/gaming.nix
    ../../home-manager/programs/discord
  ];

  config = {
    modules = {
      browsers = {
        firefox.enable = true;
      };

      editors = {
        nvim.enable = true;
      };

      multiplexers = {
        zellij.enable = true;
      };

      shells = {
        zsh.enable = true;
      };

      wms = {
        hyprland.enable = true;
      };

      terminals = {
        wezterm.enable = true;
      };
    };

    my.settings = {
      wallpaper = "~/dotfiles/home-manager/wallpapers/Kurzgesagt-Galaxy_3.png";
      host = "huawei";
      default = {
        shell = "${pkgs.zsh}/bin/zsh";
        terminal = "wezterm";
        browser = "firefox";
        editor = "nvim";
      };
    };

    colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

    home = {
      username = lib.mkDefault "olivergeneser";
      homeDirectory = lib.mkDefault "/home/${config.home.username}";
      stateVersion = lib.mkDefault "23.11";
    };
  };
}
