#!/bin/sh

initial_dir=$(pwd)
cd "$(dirname "$(realpath "$0")")" || exit 1

if [ "$1" != "--conf" ] && [ "$1" != "--nix" ]
then
	echo "Usage: ./install.sh [...]"     >/dev/stderr
	echo "  --conf    Update dotfiles"   >/dev/stderr
	echo "  --nix     Update nix-config" >/dev/stderr
	exit 1
fi

if [ "$1" = "--conf" ]
then
	cp -R .config/ "$HOME"
	cp .tmux.conf "$HOME"
	cp .zshrc "$HOME"
	cp -R .moc/ "$HOME"

	tmux source "$HOME/.tmux.conf" >/dev/null 2>&1

fi

if [ "$1" = "--nix" ]
then
	if [ "$(whoami)" != "root" ]
	then
		echo "Must be run as root to set nix config" >/dev/stderr
		exit 1
	fi
	cp nixos/configuration.nix /etc/nixos/configuration.nix
	nixos-rebuild switch
fi

cd "$initial_dir" || exit 1
