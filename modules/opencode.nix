{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		opencode
	];

	xdg.configFile."opencode/config.json".text = builtins.toJSON {
		"$schema" = "https://opencode.ai/config.schema.json";
		autoshare = false;
		theme = "system";
		permission = {
			edit = "ask";
			bash = {
				"ls*" = "allow";
				"*" = "ask";
			};
		};
	};
}
