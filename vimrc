" =============================================================
"                      VUNDLE
" =============================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-vinegar'

Plugin 'rbgrouleff/bclose.vim'
Plugin 'bling/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'wincent/Command-T'
Plugin 'SirVer/ultisnips'

Plugin 'scrooloose/nerdtree'

Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'

Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'

call vundle#end()
filetype plugin indent on
syntax on

" =============================================================
"                 GENERAL SETTINGS
" =============================================================

set backspace=indent,eol,start
set history=1000
set ruler
set showcmd
set autoindent
set showmatch
set nowrap
set autoread
set autowrite
set backupdir=~/.tmp
set directory=~/.tmp
set viminfo+=!
set guioptions-=T
set laststatus=2
set scrolloff=3
set sidescrolloff=4
set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber
set number
set wrap
set linebreak
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
set shell=bash
set clipboard=unnamed
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999
set noswapfile
set wildmenu
set nostartofline
" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1
" =============================================================
"                    AUTOCOMMANDS
" =============================================================

if has("autocmd")
  augroup vimrcEx
    au!

    autocmd BufRead *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

    autocmd BufRead,BufNewFile *.asc setfiletype asciidoc

  augroup END
endif

" =============================================================
"                      MAPPINGS
" =============================================================

let mapleader = ","

" Quick open most used files
nnoremap <leader>en :split ~/Dropbox/notes/inbox.asc<cr>
nnoremap <leader>ev :split ~/.vimrc<cr>
nnoremap <leader>es :split<cr>:UltiSnipsEdit<cr>

" create/open file in current folder
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

nnoremap <silent> <Space> :nohl<Bar>:echo<CR>
nnoremap <leader>m mzyyp`zj
nnoremap <leader>v :set invpaste paste?<CR>
nnoremap <leader>V V`]
nmap k gk
nmap j gj

noremap <Leader>d :Bclose<CR>
noremap <Leader>D :bufdo bd<CR>

cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <leader>f :CommandT<cr>
nnoremap <leader>p :CommandTFlush<cr>
nnoremap <leader>. :CommandTBuffer<cr>
nnoremap <leader>w :CommandT app/assets/javascripts<cr>
nnoremap <leader>gc :CommandT app/controllers<cr>
nnoremap <leader>gv :CommandT app/views<cr>
nnoremap <leader>gm :CommandT app/models<cr>
nnoremap <leader>gs :CommandT app/services<cr>
nnoremap <leader>gr :CommandT spec<cr>
nnoremap <leader>gp :CommandT <C-R>=expand("%:p:h") . "/"<cr><cr>

nnoremap <leader>t :call RunCurrentTest()<cr>
nnoremap <leader>a :w<cr>:call ClearScreen()<cr>:!bin/rspec<cr>
nnoremap <leader>c :w<cr>:call ClearScreen()<cr>:!bin/cucumber<cr>

nnoremap <leader>z :Gstatus<CR><C-w>20+

" =============================================================
"                 PLUGINS CONFIGURATION
" =============================================================

" Command-t
let g:CommandTMaxHeight = 15
let g:CommandTWildIgnore = &wildignore . ",**/bower_components/*,**/node_modules/*,**/tmp/*"
let g:CommandTCancelMap='<ESC>'

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

" =============================================================
"                      APPEARENCE
" =============================================================

set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Making cursor a bar in insert mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

colorscheme smyck

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       TESTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  :w
  call ClearScreen()

  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!bin/cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!bin/rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! ClearScreen()
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
endfunction

" =============================================================
"                      CUSTOM FUNCTIONS
" =============================================================

" Create folders on file save
" ===========================

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
