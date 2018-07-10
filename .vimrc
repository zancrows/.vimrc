set nocompatible      " required
filetype off          " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'

call vundle#end() 
filetype plugin indent on


syntax enable

if !exists('g:override_spf13_bundles') && filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    let g:solarized_italic=1
    set background=dark       " Assume a dark background
    colorscheme solarized             " Load a colorscheme
endif

set tabpagemax=15               " Only show 15 tabs
"set showmode                    " Display the current mode

set cursorline                  " Highlight current line

"highlight clear SignColumn      " SignColumn should match background
"highlight clear LineNr          " Current line number row will have same background color in relative mode

set autoindent
set number
set smartindent
set shiftwidth=4        " Une tabulation = 4 espaces
set tabstop=4
set expandtab        " Transformer les tabulations en espaces
set ruler        " Afficher la position courante
set smarttab        " Être intelligent dans l'utilisation des tabulations
set fileencoding=utf-8          " Encoder en UTF-8
set wildignore=*.o,*~
set shell=bash        " si sur windows  à commenter
set foldmethod=syntax " fold spécifié selon la syntaxe du langage
set nofoldenable      " par défaut on laisse tout visible 
set foldlevel=1       " on repli pour le premier niveau

" Autocomplétion intelligente
set omnifunc=syntaxcomplete#Complete

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

highlight NoSpacesEOL ctermbg=red ctermfg=white guibg=#592929
match NoSpacesEOL / \+$/

highlight NoTabs ctermbg=red ctermfg=white guibg=#592929
match NoTabs /\t/

" Aller à l'onglet suivant
nnoremap <C-Left>  :tabprevious<CR>
" Aller à l'onglet précédent
nnoremap <C-Right>  :tabnext<CR>
" Fermer l'onglet courant
nnoremap <C-c> :tabclose<CR>
" Ouvrir un nouvel onglet
nnoremap <C-t> :tabnew<CR>
" Afficher arborescence
map <F2> <Esc>:NERDTreeToggle<CR><Esc>:NERDTreeMirror<CR>
" retour sur NERDTree
nnoremap <silent> <F9> :NERDTree<CR><Esc>:NERDTreeMirror<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Always show the status line
set laststatus=2

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

