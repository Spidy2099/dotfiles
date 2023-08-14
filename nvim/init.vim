" Allow nvim to use OS's clipboard
set clipboard+=unnamedplus

" Save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
" number of undo saved
set undolevels=1000
set undoreload=1000

" Set line number
set number

" Set tabs indenting (set it to 4)
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
  
" Set Command-Line mode history number
set history=200
