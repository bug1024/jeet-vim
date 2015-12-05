"===============================================================
" Vim Configuration
"===============================================================
" Author    Jeet
" Version   2.0
" Date      2015.12.5
"===============================================================

"---------------------------------------------------------------
" Install Plugins
"---------------------------------------------------------------
" With a map leader it's possible to do extra key combinations
let mapleader   = ","
let g:mapleader = ","

" Syntax highlight
syntax on

" Install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
"----------------------------------------------------------------

"----------------------------------------------------------------
" General Setting
"----------------------------------------------------------------
" Set how many lines of history VIM has to remember
set history=2000

" Set to auto read when a file is changed from the outside
set autoread

" Allow for cursor beyond last character
set virtualedit=onemore

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
cmap w!! w !sudo tee % >/dev/null

" Autoload .vimrc when it changes
autocmd! bufwritepost .vimrc source %

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Use space to open or close fold line
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>)

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Copy|Paste everwhere
"if has('clipboard')
"    if has('unnamedplus')  " When possible use + register for copy-paste
"        set clipboard=unnamed,unnamedplus
"    else         " On mac and Windows, use * register for copy-paste
"        set clipboard=unnamed
"    endif
"endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
"----------------------------------------------------------------

"----------------------------------------------------------------
" Display Setting
"----------------------------------------------------------------
"Always show line number
set number

"Always show current position
set ruler

"Display tabs and trailing spaces visually
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Height of the command bar
set cmdheight=2

" Show current line
set cursorcolumn
set cursorline

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Set 7 lines away from margins when moving vertically using j/k
set scrolloff=7

" Add a bit extra margin to the left
"set foldcolumn=1

" Display content on terminal when quit vim
set t_ti= t_te=

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai

" Smart indent
set si

" Puts new vsplit windows to the right of the current
set splitright

" Puts new split windows to the bottom of the current
set splitbelow

" No wrap lines
set nowrap

" No welcome window
set shortmess=atI
"----------------------------------------------------------------

"----------------------------------------------------------------
" UI Setting
"----------------------------------------------------------------
"set background=dark
"colorscheme solarized
"set t_Co=256
"" solarized部分修改
"hi! VertSplit guifg=#003745 cterm=NONE term=NONE ctermfg=NONE ctermbg=NONE
"hi! LineNR guifg=#004C60 gui=bold guibg=#002B36 ctermfg=243
"hi! link NonText VertSplit
"hi! Normal guifg=#77A5B1
"hi! Constant guifg=#00BCE0
"hi! Comment guifg=#52737B
"hi! link htmlLink Include
"hi! CursorLine cterm=NONE gui=NONE
"hi! Visual ctermbg=233
"hi! Type gui=bold
"hi! EasyMotionTarget ctermfg=100 guifg=#4CE660 gui=bold

"设置标记一列的背景颜色和数字一行颜色一致
"hi! link SignColumn   LineNr
"hi! link ShowMarksHLl DiffAdd
"hi! link ShowMarksHLu DiffChange

"----------------------------------------------------------------

"----------------------------------------------------------------
" Encoding Setting
"----------------------------------------------------------------
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Judge encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Terminal encoding
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m

" 合并两行中文时，不在中间加空格：
set formatoptions+=B
"----------------------------------------------------------------

"----------------------------------------------------------------
" Keymap Setting
"----------------------------------------------------------------
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move to line header or footer
map H ^
map L $

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Switch to tab quickly
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Vim cmd keymap
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Syntax switch
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
" Clear tab
nmap <F7> :%s/\s\+$//g<CR>:noh<CR>
" Clear space
nmap <F8> :retab!<CR>
" Clear  ^M
nmap cM :%s/\r$//g<CR>:noh<CR>
"----------------------------------------------------------------

"----------------------------------------------------------------
" Others Setting
"----------------------------------------------------------------
set completeopt=longest,menu
"----------------------------------------------------------------

"----------------------------------------------------------------
" Useful Functions
"----------------------------------------------------------------
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
        call CmdLine("Ack \"" . l:pattern . "\" " )
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
"----------------------------------------------------------------
