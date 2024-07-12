source $HOME/.config/zsh/themes/oxides.zsh-theme
alias firefox="flatpak run org.mozilla.firefox"
alias memtest="CK_FORK=no valgrind -s -q --leak-check=full --show-leak-kinds=all --error-exitcode=1 $@"
alias threadtest="CK_FORK=no valgrind -s -q --tool=helgrind --error-exitcode=1 $@"
alias py="python -q -i $HOME/.config/python/pythonrc.py"
EDITOR=nvim
