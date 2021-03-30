" Syntax highlighting
:syntax on

" Turn on line number
:set number

"Turn on the mouse
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Word wrap without line breaks
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
:set wrap
:set linebreak
:set nolist  " list disables linebreak

" turn off backups. Use git instead!
set nobackup
set noswapfile

" show filename
set laststatus=2

" auto reload vimrc
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

execute pathogen#infect()
