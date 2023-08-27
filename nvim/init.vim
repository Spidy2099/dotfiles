""""""""""""""""""""""""
" Normal Nvim Settings "
""""""""""""""""""""""""
" Allow nvim to use OS's clipboard
set clipboard+=unnamedplus

" Save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
" number of undo saved
set undolevels=1000
set undoreload=1000

" Set line number
set number " Show current line number
set relativenumber " Show relative line number

" Set tabs indenting (set it to 4)
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
  
" Set Command-Line mode history number
set history=200

" Interval time for writing swap file
set updatetime=1000

" Case insensative
set ignorecase
set smartcase


"""""""""""""""""""
" Keymap Settings "
"""""""""""""""""""
" set <space> key as a leader
nnoremap <space> <nop>
let mapleader = "\<space>"
nnoremap <leader>bn :bn<cr> " buffer next 
nnoremap <leader>r :source $MYVIMRC<cr> " set <leader> + r to reload the init.vim file
nnoremap <leader>q :q<cr> " quit nvim quikly


"""""""""""""""""""""""
" Vim-Plugins Manager "
"""""""""""""""""""""""
" Use vim-plug to manage plugins "
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged") " Set the plugin install path
Plug 'chrisbra/csv.vim' " make csv file more reable
Plug 'moll/vim-bbye' " close buffer using `Bdelete`, keep the window so it can keep the window layout
Plug 'simeji/winresizer' " manage the windows
Plug 'junegunn/fzf.vim', { 'do':{ -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy search in buffer list, command history, and so on
Plug 'simnalamburt/vim-mundo' " manipulate the undo tree
Plug 'christoomey/vim-tmux-navigator' " work with tmux pane navigation
Plug 'neoclide/coc.nvim', {'bracnh': 'release'}
Plug 'wellle/tmux-complete.vim' " auto-complete contents from tmux session
Plug 'tpope/vim-surround' " add/delete/replace surrondings of a textobject
Plug 'easymotion/vim-easymotion' " move cursor with <leader><leader>+w/b/f
call plug#end()

"""""""""""
" csv.vim "
"""""""""""
autocmd BufRead,BufWritePost *.csv :%ArrangeColumn! "Format CSV more reable when read or write buffer
autocmd BufWritePre *.csv :%UnArrangeColumn  "Don't save the fomatting when write the file

""""""""""""""
" winresizer "
""""""""""""""
let g:winresizer_start_key = "<leader>w" " Use <leader> + w to use plugin to manage window

"""""""""""
" coc.vim "
"""""""""""
let g:coc_global_extensions = [
            \'coc-marketplace',
            \'coc-json',
            \'coc-snippets',
            \]
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> <leader>e <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>E <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader> + h to show documentation in preview window
nnoremap <leader>h :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
