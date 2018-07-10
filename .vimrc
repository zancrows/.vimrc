set nocompatible    " required > annule la rétro compatibilité avec VI
filetype off        " required


""" Utilisation de vundle pour charger les différents plugins


filetype plugin indent on  


""" Activation de différente option
syntax on               " active la coloration syntaxique
set noswapfile          " ne créé pas de swap file
set number              " affiche les numéros de ligne
set smartindent         " Indentation intelligente
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
"set cursorline          " Highlight current line
set tabpagemax=15       " Only show 15 tabs
"set foldenable          " enable folding
"set foldcolumn=3        " add a fold column
"set foldmethod=syntax   " Fold spécifié selon la syntaxe du langage


""" scheme
colorscheme torte
"set t_Co=88


""" affiche en rouge quand une ligne dépasse les 81 caractères, les tabulations
""" et les espaces en fin de ligne
match ErrorMsg /\%81v.*\|\t\| \+$/


""" ajout de raccourcie
" map <F2> <Esc>:NERDTreeToggle<CR><Esc>:NERDTreeMirror<CR> " Afficher/enlever NERDTree
nmap <C-Left>  :tabprevious<CR> " Aller à l'onglet suivant
nmap <C-Right>  :tabnext<CR>    " Aller à l'onglet précédent
nmap <C-c> :tabclose<CR>        " Fermer l'onglet courant
nmap <C-t> :tabnew<CR>          " Ouvrir un nouvel onglet
imap <C-Space> <C-x><C-o>       " utilisation de l'omni completion

" support pavé numérique dans PuTTY
imap ^[Oq 1
imap ^[Or 2
imap ^[Os 3
imap ^[Ot 4
imap ^[Ou 5
imap ^[Ov 6
imap ^[Ow 7
imap ^[Ox 8
imap ^[Oy 9
imap ^[Op 0
imap ^[On .
imap ^[OR *
imap ^[OQ /
imap ^[Ol +
imap ^[OS -


" Enable omni completion.
"set omnifunc=syntaxcomplete#Complete
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc



""" for Linux 
"set shell=bash     " On précise le shell à utiliser
"set visualbell     " Utilisation du clignotement à la place du "beep"
"set noerrorbells 

""" for Windows
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

