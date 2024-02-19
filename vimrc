" ---interface----------------------------------------------------------------
if has('termguicolors')
    set termguicolors
else
    set t_Co=256
endif
filetype plugin indent on
syntax on
set title
set encoding=utf-8
set guifont=FiraCode\ Nerd\ Font\ Mono:h12
set backspace=indent,eol,start
set noerrorbells
set confirm
set mouse=a
set hidden
set clipboard=unnamedplus
set splitbelow
set splitright
set fillchars=vert:│,fold:-,eob:~,lastline:@
" -----------------------------------------------------------------------------
"configuração de arquivos e buffers
set path=.,**
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" -----------------------------------------------------------------------------
"exibição
set nowrap
set linebreak
set nolist
set listchars=tab:›-,space:·,trail:◀,eol:↲
set number
set relativenumber
set scrolloff=2
set cursorline
" -----------------------------------------------------------------------------
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"
" -----------------------------------------------------------------------------
set autoindent
set smartindent
" -----------------------------------------------------------------------------
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" -----------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hls
let @/ = ""
set shortmess+=c
set completeopt=menuone,longest

" -----------------------------------------------------------------------------
"colors
colorscheme habamax

hi Normal guibg=NONE ctermbg=NONE
hi CursorLine guibg=#202130
hi Comment cterm=italic gui=italic
" ----------------------------------------------------------------------------
set noshowmode
set laststatus=2


hi statusline   cterm=NONE ctermfg=0 ctermbg=7   guibg=#C1C2D0 guifg=#000000
hi statuslinenc cterm=NONE ctermfg=0 ctermbg=240 guibg=#616270 guifg=#000000

augroup ModeEvents
    autocmd!
    au InsertEnter * hi statusline cterm=NONE ctermfg=0 ctermbg=10 guibg=#7BC86F
    au InsertLeave * hi statusline cterm=NONE ctermfg=0 ctermbg=7 guibg=#C1C2D0
    au ModeChanged *:[vV\x16]* hi statusline cterm=NONE ctermfg=0 ctermbg=13 guibg=#C990DC
    au Modechanged [vV\x16]*:* hi statusline cterm=NONE ctermfg=0 ctermbg=7 guibg=#C1C2D0
augroup end


" ----------------------------------------------------------------------------
"menu 
" -- Accept with right arrow or enter --
inoremap <expr> <right> pumvisible() ? '<c-y>' : '<right>'
inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>'

" -- Cancel completion with left arrow --
inoremap <expr> <left> pumvisible() ? '<c-e>' : '<left>'

" -----------------------------------------------------------------------------
set wildmenu
set wildmode=longest,full
set wildoptions=pum
" ----------------------------------------------------------------------------
"Plugin
call plug#begin()

Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'shime/vim-livedown'

call plug#end()

"plugins config
"Nerd Tree
map <C-n> :NERDTreeToggle<cr>
"airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='base16_classic_dark'
let g:airline#extensions#tabline#formatter = 'default'

" Configuração do UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_custom_snippets", "python"]

" fzf config
nnoremap <C-p> :FZF<cr>

"livedown
nnoremap <C-S-m> :LivedownToggle<CR>
" ----------------------------------------------------------------------------
"Comando e atalhos

" navegação entre os buffers
nnoremap <C-J> :bn<cr>
nnoremap <C-K> :bp<cr>
nnoremap <c-x> :bp\|bd #<cr>

nnoremap <C-s> :w<cr> 
inoremap ;; <Esc>

" ----------------------------------------------------------------------------
"Scripts
"hashbang
function! Hashbangs()
    let hb = ['#!/bin/bash', '#!/usr/bin/env bash', '#!/bin/sh', '#!/usr/bin/awk -f']
    call complete(col('.'), hb)
    return ''
endfunction

imap <c-x>h <c-r>=Hashbangs()<cr>
" ----------------------------------------------------------------------------

