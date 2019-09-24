"""""""""""""""""""""""""""""""""""""
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

" Set Proper Tabs
set tabstop=4
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
" set nowrap
set updatetime=1000
set autochdir
set previewheight=5
set virtualedit=all
set scrolloff=999

" Set wrapfile directory
set bdir-=.
set bdir+=/tmp
set dir-=.
set dir+=/tmp

" case insensitive search YEAY
set ic
set hlsearch

" Set the tags
" set tags+=tags
set tags=tags;/
let g:autotagTagsFile=".tags"

" Theme and Styling 
set t_Co=256
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace

" Set all the filetype settings local
filetype plugin on

"""""""""""""""""""""""""""""""""""""
" VIM-plug configuration
"""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Utility
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
Plug 'christoomey/vim-tmux-navigator'                               " TMux controls integrated in VIM
Plug 'tmux-plugins/vim-tmux-focus-events'                           " TMux focus events

" Generic Programming Support
Plug 'w0rp/ale'
Plug 'romainl/vim-qf'                                               " Managing quickfix windows (for instance ale error windows)
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'valloric/youcompleteme'
Plug 'ludovicchabant/vim-gutentags'                                 " Automatically create tags file and keep it up to date
Plug 'uncrustify/uncrustify'
Plug 'shougo/echodoc'                                               " Displays method signature in command line bottom screen

" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" PHP Support
Plug 'tobyS/pdv'                                                    " Generate PHPDocs
Plug 'arnaud-lb/vim-php-namespace'                                  " Auto insert using statements and sort them

" Theme / Interface
Plug 'ajh17/Spacegray.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" C# Support
Plug 'OmniSharp/omnisharp-vim'

" Typescript Support
Plug 'leafgarland/typescript-vim'

" Markdown support
Plug 'JamshedVesuna/vim-markdown-preview'

" LaTeX support
Plug 'lervag/vimtex'

" OSX stupid backspace fix
set backspace=indent,eol,start

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""
" Styling
colorscheme spacegray
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h12

" VIMTEX
    let g:tex_flavor = 'latex'
    let g:vimtex_view_method = 'skim'
" END VIMTEX

" LIGHTLINE
    let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head'
        \ }
    \ }
" END LIGHTLINE

" " VIM-AIRLINE
"     if !exists('g:airline_symbols')
"         let g:airline_symbols = {}
"     endif
"
"     " unicode symbols
"     let g:airline_left_sep = '»'
"     let g:airline_left_sep = '▶'
"     let g:airline_right_sep = '«'
"     let g:airline_right_sep = '◀'
"     let g:airline_symbols.linenr = '␊'
"     let g:airline_symbols.linenr = '␤'
"     let g:airline_symbols.linenr = '¶'
"     let g:airline_symbols.branch = '⎇'
"     let g:airline_symbols.paste = 'ρ'
"     let g:airline_symbols.paste = 'Þ'
"     let g:airline_symbols.paste = '∥'
"     let g:airline_symbols.whitespace = 'Ξ'
"
"     " airline symbols
"     let g:airline_left_sep = ''
"     let g:airline_left_alt_sep = ''
"     let g:airline_right_sep = ''
"     let g:airline_right_alt_sep = ''
"     let g:airline_symbols.branch = ''
"     let g:airline_symbols.readonly = ''
"     let g:airline_symbols.linenr = ''
"
"     let g:airline#extensions#ale#enabled = 1
"     let g:airline_powerline_fonts = 1
"     let g:webdevicons_enable_airline_statusline = 1
"     let g:airline_theme='deus'
"     let g:hybrid_custom_term_colors = 1
"     let g:hybrid_reduced_contrast = 1
"
"     let g:airline#extensions#tabline#enabled = 0
"     let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" " END VIM_AIRLINE

" NERDTREE
    map <C-n> :NERDTreeToggle<CR>
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
" END NERDTREE

" START GUTENTAGS
    set statusline+=%{gutentags#statusline()}
" END GUTENTAGS

" ALE
    " Add keystrokes for Ale
    nmap <silent> <leader>aj :ALENext<cr>
    nmap <silent> <leader>ak :ALEPrevious<cr>
    nmap <silent> <leader>bd :ALEDisableBuffer<CR>
    nmap <silent> <leader>be :ALEEnableBuffer<CR>
    
    let g:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
    let g:ale_set_signs = 1
    let g:ale_sign_column_always = 1
    let g:ale_warn_about_trailing_whitespace = 1
    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '--'
    let g:ale_lint_on_text_changed = 1
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_enter = 1
    let g:ale_open_list = 1
    let g:ale_keep_list_window_open = 0
" END ALE

" VIM-QF
    let g:qf_loclist_window_bottom=0
" END VIM-QF

" YOUCOMPLETEME
    set completeopt-=preview
" END YOUCOMPLETEME

" ECHODOC
    " This plugin needs the command line to be visible
    set cmdheight=2
" END ECHODOC

" VIM-GITGUTTER
    " Change hunks
    nmap ]h <Plug>(GitGutterNextHunk)
    nmap [h <Plug>(GitGutterPrevHunk)
    nmap [uh <Plug>(GitGutterUndoHunk)
    nmap [lh <Plug>(GitGutterLineHighlightsToggle)
    nmap [ht <Plug>(GitGutterToggle)
" END VIM-GITGUTTER

" START VIM-MARKDOWN-PREVIEW
let vim_markdown_preview_github = 1
" END VIM-MARKDOWN-PREVIEW                                                                                                                                                                          

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
" noremap  <silent> 0 g0
" noremap  <silent> $ g$
