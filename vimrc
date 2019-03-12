
" Maintainer:   Artur Silicki <artur.silicki@gmail.com>

no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>


iabbr pdb; import pdb; pdb.set_trace() <ESC>
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set number
" Rempa Escape to jj 
:imap jj <Esc>

" Change path to python3 - adds a powerline
 set rtp+=/home/artursil/anaconda3/lib/python3.7/site-packages/powerline/bindings/vim


" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile    " keep an undo file (undo changes after closing)
  endif
endif

"if &t_Co > 2 || has("gui_running")
"  " Switch on highlighting the last used search pattern.
"  set hlsearch
"endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

syntax on
color dracula

"Tmp files in different directories
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

"Copying outside VIM
vmap <C-c> "+yi<ESC>
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Change tabs to spaces - overwritten in .vim/after/ftplugin/python.vim
:set expandtab softtabstop=0 tabstop=4

"Change background to transparent (use terminal color)
hi Normal guibg=NONE ctermbg=NONE

" By defualt hides all docstrings
autocmd FileType python PyDocHide

" Setting for ctags
set tags=tags;
set tags=./tags;


"Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Set airline theme
:let g:airline_theme='powerlineish'

" Line showing 80 character
set tw=79
set colorcolumn=80


" ### Ctrl P package for file fuzzy search
"git submodule add  https://github.com/kien/ctrlp.vim.git bundel/ctrlp

let g:ctrlp_map = '<c-p>'

" ### vim-jedi
" Option to disable completion
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 0

" ### Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
map <F8> <ESC>:call SyntasticToggleMode()<CR>
hi SpellBad term=reverse ctermbg=darkgreen
let g:ctrlp_cmd = 'CtrlP'
