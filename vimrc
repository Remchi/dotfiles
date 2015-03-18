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
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mattn/emmet-vim'

Plugin 'rbgrouleff/bclose.vim'
Plugin 'bling/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'SirVer/ultisnips'
" Plugin 'skalnik/vim-vroom'
Plugin 'janko-m/vim-test'

Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'machakann/vim-textobj-delimited'
Plugin 'rizzatti/dash.vim'
Plugin 'gorkunov/smartpairs.vim'

" Test Run
Plugin 'terryma/vim-expand-region'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'takac/vim-hardtime'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/csapprox'
Plugin 'mmai/wikilink'
Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'mtth/scratch.vim'
Plugin 'slim-template/vim-slim'

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

    au BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
  augroup END
endif

" =============================================================
"                      MAPPINGS
" =============================================================

let mapleader = ","

" Quick open most used files
nnoremap <leader>em :!open -a 'Marked 2.app' '%:p'<cr>
nnoremap <leader>en :e ~/Dropbox/gollum/home.md<cr>
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>es :split<cr>:UltiSnipsEdit<cr>

" create/open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

nnoremap <silent> <space> :nohl<Bar>:echo<CR>
nnoremap <leader>m mzyyp`zj
nnoremap <leader>v :set invpaste paste?<CR>
nnoremap <leader>V V`]
nmap k gk
nmap j gj
nnoremap H ^
nnoremap E $

noremap <Leader>d :Bclose<CR>
noremap <Leader>D :bufdo bd<CR>

cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>

" nnoremap <leader>f :CommandT<cr>
" nnoremap <leader>p :CommandTFlush<cr>
" nnoremap <leader>. :CommandTBuffer<cr>
" nnoremap <leader>w :CommandT app/assets/javascripts<cr>
" nnoremap <leader>gc :CommandT app/controllers<cr>
" nnoremap <leader>gv :CommandT app/views<cr>
" nnoremap <leader>gm :CommandT app/models<cr>
" nnoremap <leader>gs :CommandT app/services<cr>
" nnoremap <leader>gr :CommandT spec<cr>
" nnoremap <leader>gp :CommandT <C-R>=expand("%:p:h") . "/"<cr><cr>

" nnoremap <leader>t :call RunCurrentTest()<cr>
" nnoremap <leader>a :w<cr>:call ClearScreen()<cr>:!bin/rspec<cr>
" nnoremap <leader>c :w<cr>:call ClearScreen()<cr>:!bin/cucumber<cr>

" CtrlP plugin 
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>w :CtrlP app/assets/javascripts<cr>
nnoremap <leader>. :CtrlPBuffer<cr>
nnoremap <leader>p :CtrlPClearCache<cr>
nnoremap <leader>gc :CtrlP app/controllers<cr>
nnoremap <leader>gv :CtrlP app/views<cr>
nnoremap <leader>gm :CtrlP app/models<cr>
nnoremap <leader>gs :CtrlP app/services<cr>
nnoremap <leader>gr :CtrlP spec<cr>
nnoremap <leader>gt :CtrlP ~/Dropbox/gollum<cr>
nnoremap <leader>gp :CtrlP <C-R>=expand("%:p:h") . "/"<cr><cr>

nnoremap <leader>z :Gstatus<CR><C-w>20+

" nnoremap <leader>. :buffers<cr>:buffer<space>
nnoremap <leader>1 1gt<cr>
nnoremap <leader>2 2gt<cr>
nnoremap <leader>3 3gt<cr>
nnoremap <leader>4 4gt<cr>

" Rails plugin navigation
" nnoremap <leader>gc :Econtroller 
" nnoremap <leader>gm :Emodel 
" nnoremap <leader>gv :Eview 
" nnoremap <leader>gr :Espec 
" nnoremap <leader>gj :Ejavascript 
" nnoremap <leader>gs :Eservice 
" nnoremap <leader>gi :Einitializer 

" inc search for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" =============================================================
"                 PLUGINS CONFIGURATION
" =============================================================

" Command-t
" let g:CommandTMaxHeight = 15
" let g:CommandTWildIgnore = &wildignore . ",**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*"
" let g:CommandTCancelMap='<ESC>'

" NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1

" Easymotion
nmap s <Plug>(easymotion-s)
omap e <Plug>(easymotion-bd-t)
vmap e <Plug>(easymotion-bd-t)
nmap <leader>n <Plug>(easymotion-bd-jk)

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

" Vroom
" let g:vroom_use_spring = 1
" let g:vroom_use_binstubs = 1
" let g:vroom_rspec_version = '3.x'
" let g:vroom_cucumber_path = './bin/cucumber'

" Markdown
let g:vim_markdown_folding_disabled=1

" CtrlP
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
" let g:test#rspec#executable = 'bin/rspec'

" scratch
let g:scratch_filetype = 'markdown'

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

if has("gui_running")
  set guifont=Source\ Code\ Pro\ for\ Powerline:h12
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       TESTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! RunCurrentTest()
"   :w
"   call ClearScreen()
"
"   let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
"   if in_test_file
"     call SetTestFile()
"
"     if match(expand('%'), '\.feature$') != -1
"       call SetTestRunner("!bin/cucumber")
"       exec g:bjo_test_runner g:bjo_test_file
"     elseif match(expand('%'), '_spec\.rb$') != -1
"       call SetTestRunner("!rspec")
"       exec g:bjo_test_runner g:bjo_test_file
"     else
"       call SetTestRunner("!ruby -Itest")
"       exec g:bjo_test_runner g:bjo_test_file
"     endif
"   else
"     exec g:bjo_test_runner g:bjo_test_file
"   endif
" endfunction
"
" function! SetTestRunner(runner)
"   let g:bjo_test_runner=a:runner
" endfunction
"
" function! RunCurrentLineInTest()
"   let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
"   if in_test_file
"     call SetTestFileWithLine()
"   end
"
"   exec "!bin/rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
" endfunction
"
" function! SetTestFile()
"   let g:bjo_test_file=@%
" endfunction
"
" function! SetTestFileWithLine()
"   let g:bjo_test_file=@%
"   let g:bjo_test_file_line=line(".")
" endfunction
"
" function! ClearScreen()
"   :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"   :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"   :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"   :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"   :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
"   :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
" endfunction

" =============================================================
"                      PROJECTIONS
" =============================================================

let g:rails_projections = {
      \ "app/services/*.rb": {
      \   "command": "service",
      \   "template":
      \     ["class %S", "end"],
      \   "test": [
      \     "test/unit/%s_uploader_test.rb",
      \     "spec/services/%s_spec.rb"
      \   ],
      \   "keywords": "process version"
      \ }}

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

" Selecta
" ===========================
" function! SelectaCommand(choice_command, selecta_args, vim_command)
"   try
"     let selection = system(a:choice_command . " | selecta " . a:selecta_args)
"   catch /Vim:Interrupt/
"     " Swallow the ^C so that the redraw below happens; otherwise there will be
"     " leftovers from selecta on the screen
"     redraw!
"     return
"   endtry
"   redraw!
"   exec a:vim_command . " " . selection
" endfunction
"
" function! SelectaFromList(choices, selecta_args, vim_command)
"   let non_blank_choices = filter(a:choices, 'v:val !=""')
"   call SelectaCommand('echo "' . escape(join(non_blank_choices, "\n"), '"') . '"', a:selecta_args, a:vim_command)
" endfunction
"
" function! SelectaBuffer()
"   let buffers = map(range(1, bufnr("$")), 'bufname(bufnr(v:val))')
"   call SelectaFromList(buffers, "", ":b")
" endfunction
"
" nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
" nnoremap <leader>. :call SelectaBuffer()<cr>
" nnoremap <leader>w :call SelectaCommand("find app/assets/javascripts/* -type f", "", ":e")<cr>
" nnoremap <leader>gc :call SelectaCommand("find app/controllers/* -type f", "", ":e")<cr>
" nnoremap <leader>gv :call SelectaCommand("find app/views/* -type f", "", ":e")<cr>
" nnoremap <leader>gm :call SelectaCommand("find app/models/* -type f", "", ":e")<cr>
" nnoremap <leader>gs :call SelectaCommand("find app/services/* -type f", "", ":e")<cr>
" nnoremap <leader>gr :call SelectaCommand("find spec/* -type f", "", ":e")<cr>
" nnoremap <leader>gp :call SelectaCommand("find " . expand("%:p:h") . "/* -type f", "", ":e")<cr>
"
