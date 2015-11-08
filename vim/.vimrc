scripte utf-8

"" General

set runtimepath+=~/.dotfiles/vim
autocmd BufWritePost ~/.dotfiles/vim/doc/* :helptags ~/.dotfiles/vim/doc

" Don't use old vi features
set nocompatible

" How many commands vi will remember
set history=1000

" Auto read when file changed
set autoread

let mapleader = " "
let g:mapleader = " "

" W sudo saves the file
command W w !sudo tee % > /dev/null

" Encoding
set fenc=utf-8
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1

set title

set undodir=~/.dotfiles/vim/undodir
set backupdir=~/.dotfiles/vim/backupdir
set directory=~/.dotfiles/vim/tmp/swap


"" Bundle
filetype off
set runtimepath+=~/.dotfiles/vim/bundle/Vundle.vim
call vundle#rc("~/.dotfiles/vim/bundle")

Bundle 'gmarik/Vundle.vim'

Bundle 'rking/ag.vim'

Bundle 'altercation/vim-colors-solarized'
if filereadable(expand("~/.dotfiles/vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  let g:solarized_contrast="normal"
  let g:solarized_visibility="normal"
  color solarized             " Load a colorscheme
endif

"Bundle 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup = 1

" %s highlight
Bundle 'osyo-manga/vim-over'
" Move easily
Bundle 'easymotion/vim-easymotion'
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

Bundle 'tomtom/tcomment_vim'

if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif

"Bundle 'fugitive.vim'  git wrapper
Bundle 'elzr/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'scrooloose/syntastic'
Bundle 'ntpeters/vim-better-whitespace'
autocmd BufWritePre <buffer> StripWhitespace

" snipMate
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'honza/vim-snippets'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" NerdTree
Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeWinPos='right'
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

" vim-multiple-cursor
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_quit_key='<Esc>'

" vim-surround
Bundle 'tpope/vim-surround'
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" MRU
Bundle 'yegappan/mru'
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

" CtrlP (Easy traverse file)
Bundle 'ctrlp.vim'
Bundle 'FelikZ/ctrlp-py-matcher'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
map <leader>o :CtrlPBuffer<cr><C-P>
map <C-O> :buffer #<cr>

let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>', '<c-]>', '<c-h>'],
  \ 'PrtDelete()':          ['<del>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       [],
  \ 'PrtHistory(1)':        [],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        [],
  \ 'ToggleType(-1)':       [],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  \ 'PrtInsert()':          ['<c-\>'],
  \ 'PrtCurStart()':        ['<c-a>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<c-b>', '<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-f>', '<right>'],
  \ 'PrtClearCache()':      ['<F5>'],
  \ 'PrtDeleteEnt()':       ['<F7>'],
  \ 'CreateNewFile()':      ['<c-y>'],
  \ 'MarkToOpen()':         ['<c-z>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }



"" Edit

" Configure backspace
set bs=indent,eol,start

" 커서의 위치를 항상 보이게 함.
set ruler

" 완성중인 명령을 표시
set sc

" 줄 번호 표시
set nu

" 줄 번호 표시 너비 설정
set nuw=5

" lines to the cursor - when moving vertically
set so=7

" Avoid garbled char in Chinese
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" wildmenu
set wildmenu
set wildmode=longest:list,full
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" 자동 줄바꿈 안함
"set nowrap
set wrap

" 마지막 편집 위치 복원 기능
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif

" search like modern browsers
set incsearch

" show matching brackets
set showmatch

" 괄호짝 찾기 기능에 사용자 괄호 종류를 더한다.
set mps+=<:>

" magic 기능 사용
set magic

" 여러 가지 이동 동작시 줄의 시작으로 자동 이동
set sol

" 키 입력 대기시간을 무제한으로, 그러나 key codes 에 대해서는 예외
set noto ttimeout

" 키 입력 대기시간 설정 (milliseconds) (ttm 을 음수로 설정하면 tm 을 따라감)
set tm=500

" 영역이 지정된 상태에서 Tab 과 Shift-Tab 으로 들여쓰기/내어쓰기를 할 수 있도록 함.
vmap <Tab> >gv
vmap <S-Tab> <gv

" allow cursor beyond last char
set virtualedit=onemore

" Spell checking
set spell

"" Search
" Highlight search result
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart about case
set smartcase

" 항상 status 라인을 표시하도록 함.
set ls=2

" display current mode
set showmode

" no extra spaces between rows
set linespace=0

" auto fold code
set foldenable

"" Syntax Highlight
" 파일의 종류를 자동으로 인식
filet plugin indent on

" Enable Syntax Highlighting
syntax enable


"" Colors
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

highlight clear SignColumn
highlight clear LineNr

"" Indent
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4


"" Backup, Undo
set nobackup
set nowb
set noswapfile

if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

"" Status Line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Column:\ %c\ \ \ %p%%


"" Clipboard
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

"" Helper Functions
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("Ag --ignore log \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

func! DeleteTillSlash()
  let g:cmd = getcmdline()

  if has("win16") || has("win32")
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  endif

  if g:cmd == g:cmd_edited
    if has("win16") || has("win32")
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    endif
  endif

  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"" ETC

filetype plugin on
filetype indent on

" Don't redraw while executing macros (performance)
set lazyredraw

" 프로그램 시작시 플러그인 로드
set lpl

ab __DATE__ :r !date +'\%Y.\%m.\%d \%H:\%M:\%S'kJA



