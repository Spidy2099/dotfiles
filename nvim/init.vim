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

" Set Key Mappings "
" set <space> key as a leader
nnoremap <space> <nop>
let mapleader = "\<space>"
nnoremap <leader>bn :bn<cr> " buffer next 
nnoremap <leader>r :source $MYVIMRC<cr> " set <leader> + r to reload the init.vim file

" Use vim-plug to manage plug:ns "
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged") " Set the plugin install path
Plug 'chrisbra/csv.vim' " make csv file more reable
Plug 'moll/vim-bbye' " close buffer using `Bdelete`, keep the window so it can keep the window layout
Plug 'simeji/winresizer' " manage the windows
Plug 'junegunn/fzf.vim', { 'do':{ -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy search in buffer list, command history, and so on
Plug 'simnalamburt/vim-mundo' " manipulate the undo tree
call plug#end()

" Config for csv.vim
autocmd BufRead,BufWritePost *.csv :%ArrangeColumn! "Format CSV more reable when read or write buffer
autocmd BufWritePre *.csv :%UnArrangeColumn  "Don't save the fomatting when write the file

" Config for winresizer
let g:winresizer_start_key = "<leader>w" " User <ctrl> + w to use plugin to manage window

