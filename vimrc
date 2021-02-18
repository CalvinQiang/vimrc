let mapleader=" "
syntax on
set nu
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
au BufRead,BufNewFile *.go set filetype=go
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=10
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


set autowrite
noremap = nzz
noremap - Nzz
noremap <leader><CR> :nohlsearch<CR>
noremap <C-y> <C-y>,
noremap n h
noremap u k
noremap e j
noremap i l

noremap U 5k
noremap E 5j
noremap N 5h
noremap I 5l
noremap <C-n> ^
noremap <C-i> $
noremap k i
noremap K I
noremap l u
map S :w<CR>
map s <nop>

map Q :q<CR>
map ; :

map si :set splitright<CR>:vsplit<CR>
map sn :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>split<CR>
map se :set splitbelow<CR>:split<CR>


map <LEADER>i <C-w>l
map <LEADER>n <C-w>h
map <LEADER>u <C-w>k
map <LEADER>e <C-w>j

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K


map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>t  <Plug>(go-test) 
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>f <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>re <Plug>(go-rename)

" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = '<C-Space>'

" UltiSnips setting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  
let g:go_list_type = "quickfix"
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags' 
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Valloric/YouCompleteMe' 

Plug 'rakr/vim-one' 

"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'majutsushi/tagbar'
" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"if has("nvim")
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
""Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-cssomni'
"Plug 'ncm2/ncm2-tern'
"Plug 'phpactor/ncm2-phpactor'
"Plug 'mattn/emmet-vim'  
"endif



call plug#end()

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === Taglist
" ===
nmap <Leader>tb :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_1/bin/ctags'  " 设置ctags所在路径
let g:tagbar_width=30 "设置tagbar的宽度
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
" ===
"if has("nvim")
"" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()
"
"set completeopt=noinsert,menuone 
"call ncm2#register_source({'name' : 'css',
            "\ 'priority': 9, 
            "\ 'subscope_enable': 1,
            "\ 'scope': ['css', 'scss', 'less'],
            "\ 'mark': 'css',
            "\ 'word_pattern': '[\w\-]+',
            "\ 'complete_pattern': ':\s*',
            "\ 'on_complete': ['ncm2#on_complete#omni',
            "\               'csscomplete#CompleteCSS'],
            "\ })
"endif
color snazzy
