" This file is part of Castle Shuri, the dotfiles of Adam Wong
" https://github.com/adamwong246/Castle-Shuri                                          
" Licensed under the GNU GENERAL PUBLIC LICENSE.                                

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
