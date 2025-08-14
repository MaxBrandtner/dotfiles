#!/bin/sh

initial_dir=$(pwd)
cd "$(dirname "$(realpath "$0")")" || exit 1

cp -R .config/ "$HOME"
cp .tmux.conf "$HOME"
cp .zshrc "$HOME"

tmux source "$HOME/.tmux.conf" >/dev/null 2>&1

cd "$initial_dir" || exit 1
