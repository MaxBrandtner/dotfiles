source $HOME/.config/zsh/themes/oxide.zsh-theme
alias firefox="flatpak run org.mozilla.firefox"
alias memtest="CK_FORK=no valgrind -s -q --leak-check=full --show-leak-kinds=all --error-exitcode=1 $@"
alias threadtest="CK_FORK=no valgrind -s -q --tool=helgrind --error-exitcode=1 $@"
alias py="python -q -i $HOME/.config/python/pythonrc.py"
alias ibeam="echo -ne '\e[5 q'"
yt2rss() {
        curl -L $1 2>/dev/null |  grep -Po "www\.youtube\.com/feeds/videos\.xml\?channel_id=[0-9a-zA-Z_-]{24}"
}
export EDITOR=nvim
echo -ne '\e[5 q'
