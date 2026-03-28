{ config, pkgs, ... }:
{
	programs.zsh = {
		enable = true;

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
			".."   = "cd ..";
			"..."  = "cd ../..";
			"...." = "cd ../../../";
		};

		initContent = ''
		  # Antidote
		  ANTIDOTE_HOME="${"\${XDG_DATA_HOME:-\${HOME}/.local/share}"}/.antidote"
		  if [ ! -d "$ANTIDOTE_HOME" ]; then
			  mkdir -p "$(dirname $ANTIDOTE_HOME)"
			  git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_HOME"
		  fi
		  source "$ANTIDOTE_HOME/antidote.zsh"

		  # Completion
		  fpath+=~/.zfunc
		  zstyle ':completion:*' menu select

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

		  # PATH
		  export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/Code/Scripts/_bin:$PATH"

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
