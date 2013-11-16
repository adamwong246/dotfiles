"  .d8888b.  888                       d8b     by...                            
" d88P  Y88b 888                       Y8P       _   __  _                      
" Y88b.      888                                /_| /  )/_| /|/|                
"  "Y888b.   88888b.  888  888 888d888 888     (  |/(_/(  |/   |                
"     "Y88b. 888 "88b 888  888 888P"   888           __      __                 
"       "888 888  888 888  888 888     888     (   //  )/| )/ _                 
" Y88b  d88P 888  888 Y88b 888 888     888     |/|/(__// |/(__)                 
"  "Y8888P"  888  888  "Y88888 888     888                                      
"
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
