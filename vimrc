
" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc
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

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

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
:setlocal softtabstop=0 tabstop=4
