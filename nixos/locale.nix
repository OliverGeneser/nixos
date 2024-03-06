{lib, ...}: {
  i18n = {
    defaultLocale = lib.mkDefault "en_DK.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "da_DK.UTF-8";
      LC_IDENTIFICATION = "da_DK.UTF-8";
      LC_MEASUREMENT = "da_DK.UTF-8";
      LC_MONETARY = "da_DK.UTF-8";
      LC_NAME = "da_DK.UTF-8";
      LC_NUMERIC = "da_DK.UTF-8";
      LC_PAPER = "da_DK.UTF-8";
      LC_TELEPHONE = "da_DK.UTF-8";
      LC_TIME = "da_DK.UTF-8";
    };
  };
  time.timeZone = "Europe/Copenhagen";

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "dk";
    xkb.variant = "nodeadkeys";
  };
  # Configure console keymap
  console.keyMap = "dk-latin1";
}
