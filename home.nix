{ config, pkgs, ... }:

{
  home.username = "cyrusgahatraj";
  home.homeDirectory = "/home/cyrusgahatraj";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  imports = [
	./modules/starship.nix
	./modules/zsh.nix
	./modules/git.nix
	./modules/opencode.nix
  ];

  home.packages = with pkgs; [
	ripgrep
	fd
	bat
	btop
	fastfetch
	jq
	libnotify
	sesh
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
