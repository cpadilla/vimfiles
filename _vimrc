" ==============================================================================
" ==============================================================================
"                                   vimrc
"                       created by Christofer Padilla
" last edit 5.5.2016
" ==============================================================================
" ==============================================================================


" ==============================================================================
"                              Quick References
" ==============================================================================


" Redirect vim console output into clipboard
"       :redir @* | pwd | redir END


" This must be set first, because it changes other options as a side effect.
set nocompatible
filetype off    " Vundle required

" Set working directory as my Google Drive folder to sync vimrc
" cd $GOOGLEDRIVE

" ==============================================================================
"                                Color Schemes
" ==============================================================================
" A list of good color themes can
" be found in Vim Colors.txt

" colorscheme chance-of-storm
" colorscheme nefertiti
" colorscheme maroloccio         " A dark midnight theme. Think Vayne
colorscheme rdark
" colorscheme gruvbox
" colorscheme kalisi
   " set background=dark
" colorscheme muon
" colorscheme chlordane
" colorscheme cthulhian
" colorscheme lodestone



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

" Remap Ctrl A
map <C-a> <Esc>ggvG

" Remap Ctrl C
vmap <C-C> "+y

" Remap Ctrl V
map <C-V> "+gP

" Remap ; to $
noremap ; $
nnoremap ; $
vnoremap ; $

" remap ctrl k + c to tcomment comment and ctrl k + u to uncomment
nmap <C-k><C-c> gcc
nmap <C-k><C-u> g<c
xmap <C-k><C-c> g>b
xmap <C-k><C-u> g<b

" :: grabs the last command
" TODO

" ==============================================================================
"                                  TABS
" ==============================================================================

noremap <C-Tab> :bn<CR>
noremap <C-S-Tab> :bp<CR>

" Ctrl+T to open new tab
noremap <C-t> :tabnew<Return>

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Change the backup directory so you don't have to see the swap/backup files
set backup              " Turn on backup
set backupdir=C:\\temp   " Set where to store backups
set dir=C:\\temp         " Set where to store the swap files

" fix E303
set directory=$TEMP

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

:command! SAVE :browse confirm saveas
:command! OPEN :browse confirm e
:command! HOME :e home.note
:command! HOST :args hosts.lnk hosts_mine\ -\ Shortcut.lnk | vertical all
:command! TODO :e home.note
:command! TAB :tabnew
:command! NEW :tabnew
:command! VIM :e $VIM
:command! VIMRC :e $VIM\_vimrc
:command! NE :NERDTree

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
"

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bc_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':BC' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':BC!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:BC(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :BC!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bc_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bc_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? BC call s:BC('<bang>', '<args>')
nnoremap <silent> <Leader>bd :BC<CR>

" ==============================================================================
"                                  Vundle
" ==============================================================================

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#rc('$HOME/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-airline/vim-airline.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomtom/tcomment_vim'

" ==============================================================================
"                               Plugin commands
" ==============================================================================

" enable airline
let g:airline#extensions#tabline#enabled = 1

" start NERDTree on startup
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"call vundle#end()
filetype plugin indent on


" ==============================================================================
"                                  Source
" ==============================================================================
" vimrc source
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
runtime vimrc
behave mswin

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








