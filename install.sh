#!/bin/bash
initial_dir=$(pwd)
cd "$(dirname "$(realpath "$BASH_SOURCE")")"

cp -R .config/ $HOME
cp .tmux.conf $HOME
cp .zshrc $HOME

cd "$initial_dir"
