if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rbgrouleff/bclose.vim'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'

filetype plugin indent on
NeoBundleCheck

set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set wrap
set linebreak

" Searching and highlights
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

set mouse=a

let mapleader = ','

if has('gui_running')
  set guifont=Sauce\ Code\ Powerline:h14 
endif

colorscheme Tomorrow-Night-Eighties

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfunction

" ===================================================================
"                          FILETYPES
" ===================================================================

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown ts=4 sts=4 et shiftwidth=4
au BufNewFile,BufRead *.json set ft=javascript


" =============================================================
"                     Vim Terminal
" =============================================================

" 256 colors for terminal vim
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Making cursor a bar in insert mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Prevent Vim from clobbering the scrollback buffer. See
"set t_ti= t_te=

" use clipboard with "+ register
set clipboard=unnamed

" =============================================================
"                     Plugins
" =============================================================

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

" Buffers
noremap <Leader>d :Bclose<CR>
noremap <Leader>D :bufdo bd<CR>

" CtrpP
nnoremap <leader>p :CtrlPClearCache<CR>

" NERDTree
map <leader>q :NERDTreeToggle<CR>

" Fugitive
nmap <leader>gs :Gstatus<CR><C-w>20+

" =============================================================
"                     Mappings
" =============================================================

nnoremap <leader>v :set invpaste paste?<CR>
nnoremap <leader>V V`]
cnoremap %% <C-R>=expand("%:p:h") . "/" <CR>


" Splits/windows options
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999

set noswapfile
