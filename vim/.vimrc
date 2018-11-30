" begin 'prominent modalitu'
" makes the mode very apparent via (colors of line numbers and statusline) and (type of horizontal and vertical cursor highlighting)
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    set nocursorcolumn
    hi Cursor ctermbg=green
    hi statusline ctermbg=black ctermfg=green
    hi LineNr ctermbg=black ctermfg=cyan
    hi CursorLine term=underline cterm=underline
    hi CursorLineNR ctermbg=green ctermfg=black
  else
    call ResetColors()
  endif
endfunction

function! InsertLeaveAction()
  call ResetColors()
endfunction

function! ResetColors()
  set cursorcolumn
  set cursorline
  hi CursorLine term=reverse cterm=reverse
  hi statusline ctermbg=black ctermfg=red
  hi LineNr ctermbg=magenta ctermfg=black
  hi CursorLineNR ctermbg=black ctermfg=red
endfunction

call ResetColors()

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveAction()
"inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>
" end 'prominent modality'

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

