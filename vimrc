
"                      VUNDLE
" =============================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
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
Plugin 'djoshea/vim-autoread'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'posva/vim-vue'
Plugin 'matze/vim-move'

Plugin 'pangloss/vim-javascript'
" Plugin 'othree/yajs.vim'
" Plugin 'othree/es.next.syntax.vim'
" Plugin 'othree/javascript-libraries-syntax.vim'
" Plugin 'isRuslan/vim-es6'

Plugin 'scrooloose/nerdtree'
Plugin 'mxw/vim-jsx', { 'for': ['jsx','javascript.jsx']}
Plugin 'tpope/vim-commentary' " or Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'othree/html5.vim'

" Colour Themes
Plugin 'GertjanReynaert/cobalt2-vim-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kaicataldo/material.vim'

" Test Run
Plugin 'tpope/vim-obsession'
Plugin 'lyokha/vim-xkbswitch' " Input Source Switcher
Plugin 'firegoby/html_entities_helper.vim'
Plugin 'dustinknopoff/TeaCode-Vim-Extension'

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
set relativenumber
" set number
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
set re=1

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
inoremap <c-e> <down>
inoremap <c-n> <left>
inoremap <c-y> <up>
inoremap <c-i> <right>

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

noremap <Leader>d :Bclose<CR>
noremap <Leader>D :bufdo bd<CR>

cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>

" FZF
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>F :Files<cr>
nnoremap <leader>. :Buffers<cr>

" Fugitive
nnoremap <leader>g :Gstatus<CR>:only<CR>

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
let NERDTreeQuitOnOpen=1

" Easymotion
nmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-bd-t)
vmap s <Plug>(easymotion-bd-t)

" Teacode
inoremap <C-e> <C-O>:call TeaCodeExpand()<CR>

" Vim Move
let g:move_key_modifier = 'C'

" Vue
" let g:vue_disable_pre_processors=1

" Markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

" JSX
let g:jsx_ext_required = 0
let g:javascript_enable_domhtmlcss = 1
let g:used_javascript_libs = 'underscore,react'

" Emmet
let g:user_emmet_settings={'javascript.jsx': {'extends':'jsx'}}
let g:user_emmet_leader_key='<C-t>'

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
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

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
colorscheme material
set background=dark

if has("gui_running")
  "set guifont=Operator\ Mono:h14
  set guifont="Input Mono:h10"
  set linespace=4
  set guioptions-=r
  colorscheme material
  let g:material_theme_style = 'default' " 'palenight' | 'dark'
  let g:material_terminal_italics = 1
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
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

" EPUB macros
" let @a = '0vf/f>c<p>A€kb€kb€kb€kb€kbp>j'
" let @b = 'gg/<p>f>a<span class="dropcap">la</span> '
" let @c = ':%s/&#151;/€PSâ€”[201~/g'
" let @f = '/fnres€kbf F<vf/;;f>c<a href="./endnotes.xhtml#note-1" id="note-€kbref-1" epub:type="noteref" style="vertical-align: supre€kb€kber;">1</a>F1F1F1'
" let @n = 'O<li id="note-1" epub:type="rearnote"><p>dd==0^0f(i<i>f)€kb€kbf)a</i>o€kbo<a href="./ch-2.xhtml#noteref-1" eput:€kb€kbb:type="se:referrer">€PSâ†©[201~<a€kb/a>€kb</p>€kb</li>j'
let @j = 'yGoo```jsPG'
let @h = 'yGoo```htmlPG'
let @t = 'yGoo```PG'
