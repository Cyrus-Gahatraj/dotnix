# Dotnix
Home Manager configuration for managing user-level packages and dotfiles.

## Prerequisites
- [Nix](https://nixos.org/download/)

## Install

**1. Add channels:**
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
```

**2. Install Home Manager:**
```bash
nix-shell '<home-manager>' -A install
```

**3. Clone and apply:**
```bash
git clone https://github.com/Cyrus-Gahatraj/dotnix ~/.config/home-manager
home-manager switch
```
