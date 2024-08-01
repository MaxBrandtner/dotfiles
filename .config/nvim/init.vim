set nowrap
set background=dark
set autoindent
set noruler
set noexpandtab
set tabstop=8
set shiftwidth=8
set scrolloff=8 
set guicursor=n-v-c-i-ci-ve:ver25
source $HOME/.config/nvim/themes/zaibatsu.vim
hi! Normal ctermbg=NONE guibg=NONE
hi! EndOfBuffer guibg=NONE ctermbg=NONE
command! E Explore
command! W w
nnoremap f o<Esc>0"_D
autocmd Filetype python setlocal noexpandtab autoindent tabstop=8 shiftwidth=8
autocmd Filetype markdown setlocal wrap linebreak noexpandtab autoindent tabstop=8 shiftwidth=8

set tags=tags,./tags,../tags,../../tags,../../../tags
nn   t          <C-]>
nn   tt         :exe ":tselect " . expand("<cword>")<C-M>
nmap T          :exe ":ptag " . expand("<cword>")<C-M>
nmap TT         :exe ":pts  " . expand("<cword>")<C-M>
