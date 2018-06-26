
"                      VUNDLE
" =============================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
Plugin 'prettier/vim-prettier'
Plugin 'w0rp/ale'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'cohama/lexima.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'gorkunov/smartpairs.vim'
" Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'digitaltoad/vim-pug'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mxw/vim-jsx', { 'for': ['jsx','javascript.jsx']}
" Plugin 'chemzqm/vim-jsx-improve'
Plugin 'tpope/vim-commentary' " or Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'othree/html5.vim'

" Colour Themes
Plugin 'GertjanReynaert/cobalt2-vim-theme'
Plugin 'morhetz/gruvbox'
Plugin 'romainl/flattened'

" Writing
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-colors-pencil'

" Test Run
Plugin 'djoshea/vim-autoread'
Plugin 'junegunn/fzf' " vs CtrlP
Plugin 'junegunn/fzf.vim'
Plugin 'matze/vim-move'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-obsession'
Plugin 'xtal8/traces.vim'
Plugin 'lyokha/vim-xkbswitch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ajh17/Spacegray.vim'
Plugin 'posva/vim-vue'
Plugin 'AndrewRadev/whitespaste.vim'
Plugin 'raphamorim/lucario'
Plugin 'soywod/kronos.vim'

call vundle#end()
filetype plugin indent on
syntax on

runtime macros/matchit.vim

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
set regexpengine=1
" set relativenumber
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
" set noesckeys
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
set lazyredraw

set path+=**
set tags=./tags;/
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
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
    " autocmd BufWinLeave *.* mkview
    " autocmd BufWinEnter *.* silent loadview

    au BufNewFile,BufReadPost *.md set filetype=markdown

    autocmd FileType javascript set formatprg=prettier\ --stdin
    "autocmd BufLeave,FocusLost * silent! wall
  augroup END
endif

" =============================================================
"                      MAPPINGS
" =============================================================

let mapleader = ","

" insert mode
inoremap <c-e> <esc>A

" Quick open most used files
nnoremap <leader>em :!open -a 'Marked 2.app' '%:p'<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>es :vs<cr>:UltiSnipsEdit<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" create/open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

nnoremap <silent> <space> :nohl<Bar>:echo<CR>
nnoremap <leader>w mzyyp`zj
nnoremap <leader>v :set invpaste paste?<CR>
nnoremap <leader>V V`]
nnoremap <leader>I V`]=
nmap k gk
nmap j gj
nnoremap H ^
nnoremap E $

noremap <Leader>d :Bclose<CR>
noremap <Leader>D :bufdo bd<CR>

cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>

" CtrlP plugin
" nnoremap <leader>f :CtrlP<cr>
" nnoremap <leader>. :CtrlPBuffer<cr>
" nnoremap <leader>p :CtrlPClearCache<cr>

" FZF
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>F :Files<cr>
nnoremap <leader>. :Buffers<cr>

" Fugitive
nnoremap <leader>z :Gstatus<CR>:only<CR>

" Tabs
nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>

" inc search for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" saves cursor after yanking in visual mode
vnoremap y myy`y
vnoremap Y myY`y

" =============================================================
"                 PLUGINS CONFIGURATION
" =============================================================

" NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1

" Easymotion
nmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-bd-t)
vmap s <Plug>(easymotion-bd-t)

" Vim Move
let g:move_key_modifier = 'C'

" Pencil
let g:pencil_neutral_code_bg = 1
let g:pencil_terminal_italics = 1

" Airline
" let g:airline#extensions#tabline#enabled = 0
" let g:airline_powerline_fonts = 1
" let g:airline_theme='papercolor'

" Markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

" CtrlP
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*

" JSX
let g:jsx_ext_required = 0
let g:javascript_enable_domhtmlcss = 1
let g:used_javascript_libs = 'underscore,react'

" Emmet
let g:user_emmet_settings={'javascript.jsx': {'extends':'jsx'}}

" Layout switcher
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
let g:XkbSwitchEnabled = 1

" Prettier
nmap <Leader>p <Plug>(Prettier)
let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'flow'
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" Ale
let g:ale_set_highlights = 0
nmap <silent> <Leader>au <Plug>(ale_previous_wrap)
nmap <silent> <Leader>ae <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': [],
\}


" =============================================================
"                      APPEARENCE
" =============================================================

"set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" colorscheme cobalt2
colorscheme cobalt2
set background=dark

if has("gui_running")
  set guifont=Operator\ Mono:h14
  set linespace=2
  set guioptions-=r
endif

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

" Remove whitespaces on save saving cursor position
" =================================================

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

nnoremap <leader>en :Files ~/Dropbox/MarkdownContent<CR>
let @e = 'yGop:w'
let @n = 'yGoi```jsP:wGzz'
nnoremap <leader>c mmggVGy`m
nnoremap <leader>x ggVGd

let @n = 'yGo```jskpG'
let @e = 'yGo```jskpGzz'
