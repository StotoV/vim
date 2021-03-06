"""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
" Some definitions
set nocompatible
set noshowmode
set encoding=utf8

" Basic options
syntax on
set relativenumber
set number
set ruler
set cursorline
set conceallevel=0
set nospell

" Set Proper Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" No room between windows
set guiheadroom=0

" Sync the clipboard with the system
set clipboard=unnamed

" Some other settings
set updatetime=100
set autochdir
set previewheight=5
set scrolloff=999
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
let mapleader=' '

" case insensitive search
set ic
" set hlsearch

" Set the tags
" set tags+=tags
set tags=tags;/
let g:autotagTagsFile=".tags"

" Theme and Styling 
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace

" Spelling
set spell spelllang=en_gb,nl

" Set all the filetype settings local
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""
" VIM-plug configuration
"""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Utility
Plug 'christoomey/vim-tmux-navigator'                               " TMux controls integrated in VIM
Plug 'tmux-plugins/vim-tmux-focus-events'                           " TMux focus events
Plug 'mbbill/undotree'                                              " Undo tree

" Theme / Interface
Plug 'ajh17/Spacegray.vim'                                          " Dark color theme
Plug 'NLKNguyen/papercolor-theme'                                   " Light color theme
Plug 'itchyny/lightline.vim'                                        " Statusbar

" Generic Programming Support
" Plug 'w0rp/ale'                                                     " Linter
Plug 'romainl/vim-qf'                                               " Managing quickfix windows (for instance ale error windows)
Plug 'tomtom/tcomment_vim'                                          " Comment whole blocks of code
" Plug 'ludovicchabant/vim-gutentags'                                 " Automatically create tags file and keep it up to date
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'                                          " Indention vertical lines
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " Fuzzy find support, installed with brew
Plug 'vim-vdebug/vdebug'                                            " General debugger
Plug 'jremmen/vim-ripgrep'                                          " Fast grep though system
Plug 'chiel92/vim-autoformat'                                       " Auto formatter

" Git Support
Plug 'airblade/vim-gitgutter'                                       " Git changes in numbers line

" LaTeX support
Plug 'lervag/vimtex'

" OSX stupid backspace fix
set backspace=indent,eol,start

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""
" STYLING "
    set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h13

    " Dark
    " set background=dark
    " colorscheme spacegray

    " Light
    set background=light
    colorscheme PaperColor
" END STYLING "

" LIGHTLINE
    let g:lightline = {
          \ 'colorscheme': 'one',
          \ 'active': {
          \   'left': [ [ 'mode', 'modified' ],
          \             [ 'readonly', 'filename', 'modified' ] ]
          \ }
    \ }
" END LIGHTLINE
    
" START UNDOTREE
    nnoremap <silent><leader>u :UndotreeToggle<CR>
" END UNDOTREE

" START VIM-RIPGREP
    nnoremap <silent><leader>gf :Rg<SPACE>
" END VIM-RIPGREP

" VDEBUG
    let g:vdebug_options = {'debug_window_level' : 0}
    nmap <silent> <leader>bp :BreakpointWindow<CR>
" END VDEBUG

" " START GUTENTAGS
"     set statusline+=%{gutentags#statusline()}
" " END GUTENTAGS

" START AUTOFORMATTER
    nnoremap <silent><leader>af :Autoformat<CR>
" END AUTOFORMATTER

" ALE
    " Add keystrokes for Ale
    " nmap <silent> <leader>aj :ALENext<cr>
    " nmap <silent> <leader>ak :ALEPrevious<cr>
    " nmap <silent> <leader>bd :ALEDisableBuffer<CR>
    " nmap <silent> <leader>be :ALEEnableBuffer<CR>
    "
    " let g:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
    " let g:ale_set_signs = 1
    " let g:ale_sign_column_always = 1
    " let g:ale_warn_about_trailing_whitespace = 1
    " let g:ale_sign_error = '>>'
    " let g:ale_sign_warning = '--'
    " let g:ale_lint_on_text_changed = 1
    " let g:ale_lint_on_save = 1
    " let g:ale_lint_on_enter = 1
    " let g:ale_open_list = 1
    " let g:ale_keep_list_window_open = 0
" END ALE

" VIM-QF
    let g:qf_loclist_window_bottom=0
" END VIM-QF

" YOUCOMPLETEME
    set completeopt-=preview
    nnoremap <silent>gd :YcmCompleter GoTo<CR>
    nnoremap <silent>gf :YcmCompleter FixIt<CR>
" END YOUCOMPLETEME

" VIM-GITGUTTER .
    highlight GitGutterAdd    guifg=#009900 guibg=#000000 ctermfg=2
    highlight GitGutterChange guifg=#bbbb00 guibg=#000000 ctermfg=3
    highlight GitGutterDelete guifg=#ff2222 guibg=#000000 ctermfg=1

    let g:gitgutter_sign_added = '++'
    let g:gitgutter_sign_modified = '~~'
    let g:gitgutter_sign_removed = '**'
    let g:gitgutter_sign_removed_first_line = '^^'
    let g:gitgutter_sign_modified_removed = 'ww'

    " Change hunks
    nnoremap ]h :GitGutterNextHunk<CR>
    nnoremap [h :GitGutterPrevHunk<CR>
    nnoremap <leader>uh :GitGutterUndoHunk<CR>
    nnoremap <leader>hf :GitGutterFold<CR>
" END VIM-GITGUTTER

" START VIM-PYDOCSTRING
    " let g:pydocstring_templates_path = '~/.vim/syntax/pydocs'
    " nnoremap <silent><leader>ds :Pydocstring<CR>
" END VIM-PYDOCSTRING

" START VIM-TMUX-NAVIGATOR
    let g:tmux_navigator_no_mappings = 1

    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <C-p> :TmuxNavigatePrevious<cr>

    let g:tmux_navigator_save_on_switch = 2
    let g:tmux_navigator_disable_when_zoomed = 1
" END VIM-TMUX-NAVIGATOR

" START INDENTLINE
    let g:indentLine_enabled = 1
" END INDENTLINE

" START FZF
    nnoremap <silent><leader>o :FZF<CR>
    nnoremap <silent><leader>O :FZF~<CR>
" END FZF

" START VIMTEX
    let g:tex_flavor = 'latex'
" END VIMTEX

"""""""""""""""""""""""""""""""""""""
" Mappings configuration
"""""""""""""""""""""""""""""""""""""
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Make moving around windows and tabs easier
" nnoremap <S-h> :wincmd h<CR>
" nnoremap <S-l> :wincmd l<CR>
" nnoremap <S-k> :wincmd k<CR>
" nnoremap <S-j> :wincmd j<CR>
nnoremap <S-h> :tabprevious<CR>
nnoremap <S-l> :tabnext<CR>

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Alternate escape
map § <Esc>
imap § <Esc>

" Navigate the display lines instead of the physical lines
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> 0 g0
noremap  <silent> $ g$
noremap  <silent> g0 0
noremap  <silent> g$ $
