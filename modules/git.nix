{ config, pkgs, ... }:
{
	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "Cyrus-Gahatraj";
				email = "cyrus@example.com";

			};
			init.defaultBranch    = "main";
			push.autoSetupRemote  = true;
			credential.helper     = "store";
			include.path          = "~/.gitconfig.local";
		};
	};
}
