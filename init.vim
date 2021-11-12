" wuu36 vimrc
" NEOVIM
" =================
" ===Editor Setup===
" ==================
" ===
" ===System
" ===
let &t_ut=''
set autochdir

syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
	
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"

set scrolloff=8

"===
"===Basic Mappings
"===
"Set <LEADER> as <SPACE>,
let mapleader=" "

"Save & Quit
map S :w<CR>
map Q :q<CR>

"Open vimrc
"noremap <LEADER>rv :e $HOME/.vim/vimrc<CR>
noremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>

"Indentation
nnoremap > >>
nnoremap < <<

"Make Y copy till end of line
nnoremap Y y$

"Search then no highlight
noremap <LEADER><CR> :nohlsearch<CR>

"???Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\)\_s*\1

"Space to Tab
"nnoremap <LEADER>yy :%s/    /\t/g ??????

"===
"=== Cursor Movement
"===
noremap J 5jzz
noremap K 5kzz
"noremap W 5w
"noremap B 5b

noremap H 0
noremap L $

"===
"=== Windows management
"===
"Split the screens
noremap sk : set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj : set splitbelow<CR>:split<CR>
noremap sh : set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl : set splitright<CR>:vsplit<CR>

"Resize splits with arrow keys
noremap <up> :res +1<CR>
noremap <down> :res -1<CR>
noremap <left> :vertical resize-1<CR>
noremap <right> :vertical resize+1<CR>

"Moving cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

"Compile function
noremap r :call CompileRun()<CR>
func! CompileRun()
    "exec "W"
    if &filetype == 'markdown'
        exec "InstantMarkdownPreview"
    endif
endfunc
    

map s <nop>
map<silent>R :source $MYVIMRC<CR>

exec "nohlsearch"
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set nu

"set background=dark

imap jj <ESC>

"===
"=== Vim Plugin
"===
call plug#begin('~/.vim/plugged')
Plug 'theniceboy/vim-deus'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

"Markdown 
Plug 'suan/vim-instant-markdown',{'for':'markdown'}
Plug 'dhruvasagar/vim-table-mode'

call plug#end()


"===
"=== Markdown Settings
"===
"Snippets
source ~/.config/nvim/md-snippets.vim

"vim-instant-markdown config

"filetype plugin on
"Uncomment to override defaults:
let g:instant_markdown_slow = 0 
let g:instant_markdown_autostart = 0 
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
"let g:instant_markdown_browser = "msedge.exe--new-window"
"let g:instant_markdown_browser = "chrome"

"vim-table-mode
noremap <LEADER>tm :TableModeToggle<CR>
let g:table_mode_corner='+'
"let g:table_mode_header_fillchar='='
let g:table_mode_align_char=':'



" WSL yank support
" let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
" if executable(s:clip)
    " augroup WSLYank
        " autocmd!
        " autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    " augroup END
" endif

colorscheme gruvbox


"===
"=== Terminal Behaviors
"===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert " when :term, into terminal and jump into the insert mode
tnoremap <C-N> <C-\><C-N>   
tnoremap <C-O> <C-\><C-N><C-O>


