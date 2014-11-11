" ==============================================================================
" ==============================================================================
"                                   vimrc
"                       created by Christofer Padilla
" last edit 11.7.2014
" ==============================================================================
" ==============================================================================


" ==============================================================================
"                              Quick References
" ==============================================================================


" Redirect vim console output into clipboard
"       :redir @* | pwd | redir END


" This must be set first, because it changes other options as a side effect.
set nocompatible

" Set working directory as my Google Drive folder to sync vimrc
cd $GOOGLEDRIVE

" ==============================================================================
"                                Color Schemes
" ==============================================================================
" A list of good color themes can
" be found in Vim Colors.txt

" colorscheme chance-of-storm
" colorscheme nefertiti
" colorscheme maroloccio         " A dark midnight theme. Think Vayne
" colorscheme rdark
" colorscheme kalisi
   " set background=dark
colorscheme muon
" colorscheme chlordane



" ==============================================================================
"                                  GUI Config
" ==============================================================================

set lines=60
set columns=160
"
" Maximize window
au GUIEnter * simalt ~x

set guifont=Consolas

" Set gui font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=CourierNew\ 18
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Auto reload vim when _vimrc changes
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" ==============================================================================
"                                General Config
" ==============================================================================
set number
set nu!
set ic
set nu!
set showcmd
set showmode
set autoread
set smartcase
syntax on

" Replaces system beep with visual bell
set vb

" Consider ‘_’ as a keyword
set iskeyword-=_

" Opening a new file when the current buffer has unsaved changes causes files
" to be hidden instead of closed
set hidden

" Configure indentation
set wrap!
set linebreak
set autoindent
set smartindent
set smarttab
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=eol,indent,start

" ==============================================================================
"                                 Remap Keys
" ==============================================================================
" See this helpful explanation on the difference between mappings
" http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping

" map control-backspace to delete the previous word
:imap <C-BS> <C-W>

" Search for visually selected text
vnorem // y/<C-r>"<cr>

" Remaps increment/decrement command to Alt-=/Alt--
" noremap <expr> p v:register=='"'?'pbvey':'p' " I don't think this is working
nnoremap <A-=> <C-a>
nnoremap <A--> <C-x>

" Remap beginning of line key (0) to ^B (Shift-b)
noremap <S-B> 0

" Remap end of line key ($) to ^E (Shift-e)
noremap <S-E> <S-$>

" Remap find matching bracket to Visual Studio shortcut
nnoremap <C-]> <S-%>

" Remap repeat last macro to `
nnoremap ` @q

" Remap moving up and down pages to <shift>k and <shift>j respectively
noremap <S-k> 5k
noremap <S-j> 5j

" Allow <Tab> to indent
" for command mode
nmap <Tab> >>
vmap <Tab> >

" Allow <Shift-Tab> to unindent
" for command mode
nmap <S-Tab> <<
vmap <S-Tab> <

" Move between Windows with Alt + Arrow Keys
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" :: grabs the last command
" TODO

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Change the backup directory so you don't have to see the swap/backup files
set backup              " Turn on backup
set backupdir=C:\temp   " Set where to store backups
set dir=C:\temp         " Set where to store the swap files

" === PLUGINS ===
" Tagbar
nmap <F8> :TagbarToggle<CR>

" Persistent Undo ~ Not sure if this works
" Keep undo history across sessions, by storing in file
" if has('persistent_undo')
"  silent !mkdir ~/.vim/backups > /dev/null 2>&1
"  set undodir=~/.vim/backups
"  set undofile
" endif

" ==============================================================================
"                                  COMMANDS
" ==============================================================================

:command! HOME :e home.note
:command! TODO :e home.note
:command! TAB :tabnew
:command! NEW :tabnew
:command! VIM :e $VIM\_vimrc

" ==============================================================================
"                                    Folds
" ==============================================================================
set foldmethod=syntax
set foldnestmax=2

" Saves folds when you close a file and loads them when you open it again
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

" ==============================================================================
"                                  Scrolling
" ==============================================================================

set scrolloff=2            "Start scrolling when we're 3 lines away from margins
set sidescrolloff=15
set sidescroll=2

" ==============================================================================
"                                Notes Options
" ==============================================================================

:let g:notes_directories = ['$GOOGLEDRIVE/Notes']
:let g:notes_suffix = '.note'

" ==============================================================================
"                                  Buffers
" ==============================================================================

" switch between buffers
" nnoremap <silent> <space>l :bprevious<CR>
" nnoremap <silent> <space>h :bnext<CR>
" nnoremap <silent> <space>d :bp\|bd #<CR>

" toggle last two buffers
" nnoremap <silent> <space>u <c-^>

" <Space-q> to :q
" nnoremap <space>q :q<CR>

" ==============================================================================
"                                  Source
" ==============================================================================
" vimrc source
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
runtime vimrc
behave mswin

" ==============================================================================
"                                  Pathogen
" ==============================================================================
execute pathogen#infect()

" ==============================================================================
"                                  Functions
" ==============================================================================

" Not really sure what this does yet
"
" set diffexpr=MyDiff()
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let eq = ''
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       let cmd = '""' . $VIMRUNTIME . '\diff"'
"       let eq = '"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction








