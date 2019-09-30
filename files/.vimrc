" vim-plug
" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" My plugins
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter' " comment lines easily
Plug 'scrooloose/nerdtree' " fs explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " git status flags for nerd tree
Plug 'mileszs/ack.vim' " for searching
Plug 'tpope/vim-fugitive' " git plugin
Plug 'airblade/vim-gitgutter' " git diff in gutter (by line numbers)
Plug 'tpope/vim-surround' " surround characters
Plug 'jiangmiao/auto-pairs' " autoclose brackets and quotes
" Plug 'ervandew/supertab' " autocomplete with tab
Plug 'chriskempson/base16-vim' " themes
Plug 'gcmt/taboo.vim' " rename tabs
Plug 'sheerun/vim-polyglot' " better language specific syntax and indentation
Plug 'ciaranm/detectindent' " auto detect indentation 
Plug 'flazz/vim-colorschemes'
" Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf' " for fzf.vim
Plug 'junegunn/fzf.vim'
Plug 'zenbro/mirror.vim' " easily edit remote files
Plug 'wlangstroth/vim-racket' " racket
Plug 'xuhdev/vim-latex-live-preview' " live preview latex files
Plug 'easymotion/vim-easymotion' " faster navigation
Plug 'christoomey/vim-tmux-navigator' " easy navigation b/w vim and tmux
Plug 'vim-scripts/ucpp-vim-syntax' " uC++ syntax highlighting
Plug 'dhruvasagar/vim-table-mode' " easily make tables in md
Plug 'ferrine/md-img-paste.vim' " paste image to directory and add to markdown
Plug 'EinfachToll/DidYouMean' " description in github page https://github.com/EinfachToll/DidYouMean
Plug 'junegunn/goyo.vim' " focused writing
Plug 'neoclide/coc.nvim', {'branch': 'release'} " better completion and intellisense
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" All of your Plugins must be added before the following line
call plug#end()
" end vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Override default leader
let mapleader="\<Space>"

set backspace=indent,eol,start " backspace over anything

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours
syntax enable " enable syntax processing

" Onedark

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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
endif

" get colorscheme from https://github.com/chriskempson/base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and spacing
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces when press <TAB> and number of spaces deleted when backspacing
set expandtab " tabs are spaces
set shiftwidth=2 " columns inserted for reindent operations (<< and >>)
set autoindent " copy indentation from pervious line when starting a new line

autocmd FileType py setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType cc setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType c setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType ucpp setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType json syntax match Comment +\/\/.\+$+ " jsonc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI config
set number " show line numbers
set showcmd " show last command entered in bottom left
set relativenumber " relative line numbers
set mouse=a " mouse controls

filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to - faster macros
set showmatch " highlight matching [{()}]
set colorcolumn=80,120 " show column guides
set noshowmode " remove --INSERT-- since it's on status line
set cmdheight=2 " better display messages

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
set incsearch " search as characters are entered
set hlsearch " hightlight matches
set ignorecase " case insensitive

" to turn off search highlighting
nnoremap <leader>y :nohlsearch<CR> 

" search match on centre of screen
nnoremap n nzz
nnoremap N Nzz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
" TODO: figure out folding...
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default - only the very nested blocks of code are folded when opening a buffer
set foldnestmax=10 " 10 nexted fold max
set foldmethod=indent " fold based on indent level

" , opens/closes folds
nnoremap , za

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
" move vertically by visual line - don't skip the 'fake' part of a wrapped line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" split movement
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader shortcuts

" quickly save
nnoremap <leader>w :w<CR>

" toggle gundo
" TODO: install gundo
nnoremap <leader>u :GundoToggle<CR> 

" save session
"nnoremap <leader>s :mksession<CR> " I don't have much use for this...

" quickly ack
nnoremap <leader>a :Ack! 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
let g:airline_powerline_fonts=1 " enable powerline symbols and glyphs
let g:airline_theme='base16'
set laststatus=2 " otherwise vim-airline doesn't appear until new split

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
nnoremap <leader>\ :NERDTreeToggle<CR>

"autocmd vimenter * NERDTree " automatically open nerdtree on startup
autocmd VimEnter * wincmd p " focus the file rather than nerdtree
" close vim if just a nerdtree left
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden=1 " show hidden by default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
noremap <leader>/ :call NERDComment(0,"toggle")<CR>
let g:NERDSpaceDelims = 1 " add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1 " allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " enable trimming of trailing whitespace when uncommenting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
\ }
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " ag is faster than vim native glob
endif
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp' " cache index

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf.vim
nnoremap <C-P> :FZF<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mirrors

nnoremap <leader>mpl :MirrorPull<CR><CR><CR>
nnoremap <leader>mps :MirrorPush<CR><CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" live latex preview

autocmd Filetype tex setl updatetime=5
let g:livepreview_previewer = 'open -a Preview'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim lightline

" this section
" * trims file format and encoding info on narrow windows
" * adds git branch to status line
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dhruvasagar/vim-table-mode
let g:table_mode_corner='|'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" md-img-paste

autocmd FileType markdown nmap <silent> <leader>pi :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'images'
" let g:mdip_imgname = 'image' " default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
" automatically format code and add missing imports on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)zz
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_generate_tags = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
set clipboard=unnamed " to yank to system clipboard
set timeoutlen=1000 ttimeoutlen=0 " mode changes (pressing 'esc') update status immediately
set shellpipe=> " so that ack.vim results don't show up in terminal after exiting vim

" nice autocomplete in vim command line stuff
set wildmenu
set wildmode=list:longest,full

inoremap jj <Esc>

set undodir=~/.vim/undodir " undodir for cross-session undo/redo stacks
set bdir-=.
set bdir+=/tmp
set dir-=.
set dir+=/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OCAML
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
