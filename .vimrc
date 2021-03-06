set nocompatible    " required > annule la rétro compatibilité avec VI
filetype off        " required


""" Utilisation de vundle pour charger différents plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'valloric/YouCompleteMe'

call vundle#end()

filetype plugin indent on


""" Activation de différente option
syntax on               " active la coloration syntaxique
set noswapfile          " ne créé pas de swap file
set number              " affiche les numéros de ligne
set backspace=indent,eol,start " permet les les retour avec autoindent
set autoindent          " Conserve l'indentation sur une nouvelle ligne
set ruler               " Affiche la position du curseur
set expandtab           " Transformer les tabulations en espaces
set shiftwidth=4        " Indentation toutes les quatre colonnes
set softtabstop=4       " une indentation = 4 espaces
set showmatch           " Surligne le mots recherchés dans le texte
set hlsearch            " Surligne tous les résultats de la recherche
set smartindent         " Active smart-indent (améliore l'auto-indentation, notamment en collant du texte déjà indenté)
set smarttab            " Active smart-tabs (améliore l'auto-indentation, Gestion des espaces en début de ligne pour l'auto-indentation)
set autoindent          " Conserve l'indentation courante sur les nouvelles lignes
set showmode            " Affiche le mode d'édition
set ruler               " Afficher la position courante
set encoding=utf-8      " Encoder en UTF-8
set fileencoding=utf-8  " Encoder en UTF-8
set termencoding=utf-8  " Encoder en UTF-8
set wildignore=*.o,*~   " On ignore les fichiers *.o et *~
set laststatus=2        " Afficher toujours la bar de status
set tabpagemax=15       " Only show 15 tabs


if has("unix")
    set shell=bash     " On précise le shell à utiliser
    "set visualbell     " Utilisation du clignotement à la place du "beep"
    set noerrorbells
endif


""" foldings
set foldmethod=indent   " Fold spécifié selon la syntaxe du langage
set foldenable          " enable folding
set foldlevelstart=99   " ouvre tous les folds
set foldcolumn=3        " ajoute 3 colonnes pour le folding
set foldnestmax=10      " maximum de folds imbriqué
"sauvegarde et rechargement des folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


""" scheme
colorscheme solarized
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

""" affiche en rouge quand une ligne dépasse les 81 caractères (+1 pour les sauts de ligne) , les tabulations
""" et les espaces en fin de ligne
match ErrorMsg /\%>82v.*\|\t\| \+$/


""" ajout de raccourcie
nmap <C-Left>  :tabprevious<CR> " Aller à l'onglet suivant
nmap <C-Right>  :tabnext<CR>    " Aller à l'onglet précédent
nmap <C-c> :tabclose<CR>        " Fermer l'onglet courant
nmap <C-t> :tabnew<CR>          " Ouvrir un nouvel onglet
" permet la completion de différent caractère
inoremap ( ()<ESC>ha
inoremap [ []<ESC>ha
inoremap " ""<ESC>ha
inoremap ' ''<ESC>ha
inoremap { {}<ESC>ha

" completion en fonction du langage
autocmd FileType java,c,cpp,css,php call s:function_brackets()


" completetion des accolades pour les fonctions, if, for etc...
function s:function_brackets()
    inoremap {<CR> {<CR>}<ESC>k$i<CR><ESC>o
endfunction


" support pavé numérique dans PuTTY
:inoremap <Esc>Oq 1
:inoremap <Esc>Or 2
:inoremap <Esc>Os 3
:inoremap <Esc>Ot 4
:inoremap <Esc>Ou 5
:inoremap <Esc>Ov 6
:inoremap <Esc>Ow 7
:inoremap <Esc>Ox 8
:inoremap <Esc>Oy 9
:inoremap <Esc>Op 0
:inoremap <Esc>On .
:inoremap <Esc>OQ /
:inoremap <Esc>OR *
:inoremap <Esc>Ol +
:inoremap <Esc>OS -
:inoremap <Esc>OM <Enter>

:let mapleader = ","

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

""" si NERDTree est la seule fenetre ouverte on ferme vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Afficher/enlever NERDTree
map <F2> <Esc>:NERDTreeToggle<CR><Esc>:NERDTreeMirror<CR> 
let NERDTreeShowBookmarks=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""" Syntasctic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" auto complétion
set completeopt-=preview
set omnifunc=syntaxcomplete#Complete
set pumheight=10                        " Taille du menu d'autocomplétion
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
