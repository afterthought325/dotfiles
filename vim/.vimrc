syntax enable
set background=dark
" Allows writing to files with root priviladges
cmap w!! w !sudo tee % > /dev/null
set number
filetype plugin on
