{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName  = "Cyrus-Gahatraj";
    userEmail = "cyrus@example.com";

    extraConfig = {
      init.defaultBranch    = "main";
      push.autoSetupRemote  = true;
      credential.helper     = "store";
	  include.path          = "~/.gitconfig.local";
    };
  };
}
