{ config, pkgs, ... }:
{
	home.sessionVariables = {
		# Docker
		DOCKER_CONFIG = "$HOME/.config/docker";

		# Python
		JUPYTER_CONFIG_DIR = "$HOME/.config/jupyter";

		# JS npm
		NPM_CONFIG_USERCONFIG = "$HOME/.config/npm/npmrc";
		NODE_REPL_HISTORY = "$HOME/.local/share/node_repl_history";

		# Rust and Cargo
		CARGO_HOME = "$HOME/.local/share/cargo";
		RUSTUP_HOME = "$HOME/.local/share/rustup";

		# Go
		GOPATH = "$HOME/.local/share/go";

		# Android
		ANDROID_USER_HOME = "$HOME/.local/share/android";
		ANDROID_HOME = "$HOME/.local/share/android";
		PUB_CACHE = "$HOME/.local/share/pub-cache";
		
        # Java
		GRADLE_USER_HOME = "$HOME/.local/share/gradle";
	};

	home.sessionPath = [
		"$HOME/.local/bin"
		"$HOME/.local/share/cargo/bin"
		"$HOME/.local/share/go/bin"
		"$HOME/Code/Scripts/_bin"
	];

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		syntaxHighlighting.enable = true;
		autosuggestion.enable = true;

		history = {
			size          = 5000;
			save          = 5000;
			ignoreDups    = true;
			ignoreAllDups = true;
			ignoreSpace   = true;
			share         = true;
		};

		shellAliases = {
			vim    = "nvim";
			ls     = "eza --icons=auto";
			ll     = "ls -lh";
			zed    = "zeditor";
			cd     = "zd";
			ts	   = "sesh connect $(sesh list --icons | fzf --ansi)";
			".."   = "cd ..";
			"..."  = "cd ../..";
			"...." = "cd ../../../";
		};

		initContent = ''
		  # Key binds
		  bindkey '^Y' autosuggest-accept

		  # Zoxide wrapper
		  zd() {
			  if [ $# -eq 0 ]; then
				  builtin cd ~ && return
			  elif [ -d "$1" ]; then
				  builtin cd "$1"
			  else
				  z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
			  fi
		  }

		  # Tmux auto-attach
		  if [[ -z "$TMUX" && -n "$PS1" && -z "$NVIM" ]]; then
			  tmux attach 2>/dev/null || tmux new-session -s main
		  fi
		'';
	 
	};

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.zoxide = {
		enable = true;
		enableZshIntegration = true;
	};
}
