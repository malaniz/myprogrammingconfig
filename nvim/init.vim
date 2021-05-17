call plug#begin()
Plug 'xarthurx/taskwarrior.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'kien/ctrlp.vim'

"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'lucidstack/ctrlp-tmux.vim'

" eth
Plug 'tomlion/vim-solidity'

" eye candy
Plug 'myusuf3/numbers.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer', { 'on': 'ColorToggle' }
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'

" typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" openscad syntax
Plug 'vim-scripts/openscad.vim'

" wiki
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'

"ledger
Plug 'ledger/vim-ledger'

"Slack
Plug 'yaasita/edit-slack.vim'

"markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

colorscheme 256_noir
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" script commands
function! Execmd()
  let g:sqlquery = @q
  if g:sqlquery == ""
    echo "no command to execute"
    return 0
  endif

  call writefile(split(g:sqlquery, "\n"), "/tmp/cmdtmp")

  if exists("g:my_run_buffer")
    set swb=usetab
    exec ":rightbelow sbuf " . g:my_run_buffer
  else
    bo new
    set buftype=nofile
    let g:my_run_buffer = bufnr("%")
  endif
  let mycmd = "%! /usr/bin/bash /tmp/cmdtmp"
  exec mycmd
endfunction

" CtrlP
let g:ctrlp_match_window='bottom,order:btt,min:2,max:25'
let g:ctrlp_working_path_mode = 'ra'
"'c' - the directory of the current file.
"'r' - the nearest ancestor that contains one of these directories or files:
"      .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is
"      not a direct ancestor of the directory of the current file.
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir', 'tmux']
nnoremap <C-s> :CtrlPTmux<CR>
nnoremap <C-w> :CtrlPTmux w<CR>

set wildmenu " enhanced autocomplete
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot
",*public/css/*,*public/js*

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:deoplete#enable_at_startup = 1

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

"call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])


" Unix as standard file type
set ffs=unix,dos,mac

" Always utf8
set termencoding=utf-8
"set encoding=utf-8
set fileencoding=utf-8


" All status line configuration goes here

set cmdheight=1
set display+=lastline

" general config
set laststatus=2 " always show status line
set showtabline=2 " always show tabline
set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it

" for finding files recursively
set path+=**
set wildignore+=*/node_modules/*,*/vendor/*,*/bower_componets/:

" grepping files
if executable('ack')
  set grepprg=ack\ -s\ -H\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
command! -bang -nargs=* -complete=file -bar Grep silent! grep! <args>
" automatically open windows after searching
autocmd QuickFixCmdPost *grep* cwindow

" airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1  " buffers at the top as tabs
" let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tmuxline#enabled=0
let g:airline_theme = 'minimalist'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = '?'
let g:airline_symbols.readonly = '?'

let g:airline#extensions#quickfix#quickfix_text = 'QF'
let g:airline#extensions#quickfix#location_text = 'LL'

" disable unused extensions (performance)
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 1
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" ledger config
let g:ledger_maxwidth = 80
let g:ledger_fillstring = '    -'
let g:ledger_detailed_first = 1
let g:ledger_fold_blanks = 0

" map Leader
let mapleader = " "
" keep backward f search, remapping it to ,;
" nnoremap <Leader>; ,

"yaasita slack configuration
let g:yaasita_slack_token = $SLACK_TOKEN
set encoding=utf-8

"_____typescript
" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
nmap <leader>i :CocCommand tsserver.organizeImports<cr>

"_____typescript

" in-line scrolling
nmap <Leader>j gj
nmap <Leader>k gk

"sql
map <Leader>ss "qy:call ExeSql()<CR>
map <Leader>rdb "qy:call ExeRepl()<CR>
map <Leader>tt  "qy:call Execmd()<CR>
map <Leader>cc "qy:call Execmd()<CR>

" finding files
nnoremap <Leader>ff :find<space>

" buffer keys
nnoremap <Leader>bb :b#<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bf :bf<CR>
nnoremap <Leader>bl :bl<CR>
nnoremap <Leader>bw :w<CR>:bd<CR>
nnoremap <Leader>bd :bd!<CR>
nnoremap <c-PageDown> :bn<CR>
nnoremap <c-PageUp> :bp<CR>

" buffers navigation
nnoremap <Leader>bl :ls<cr>:b<space>


" new buffer/tab
nnoremap <Leader>e :enew<space>

" window keys
nnoremap <Leader>wh <C-w><
nnoremap <Leader>wl <C-w>>
nnoremap <Leader>wk <C-w>-
nnoremap <Leader>wj <C-w>+
nnoremap <Leader>wx :close<CR>

" %% to expand active buffer location on cmdline
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" translate
nnoremap <silent> <leader>t :Translate<CR>
vnoremap <silent> <leader>t :TranslateVisual<CR>

" clipboard
set clipboard=unnamedplus
set go+=a

" spaces instead of tabs
set tabstop=2 shiftwidth=2 expandtab

" save without trailing spaces
autocmd BufWritePre <buffer> %s/\s\+$//e

" vpaste
map vp :exec "w !vpaste ft=".&ft<CR>
vmap vp <ESC>:exec "'<,'>w !vpaste ft=".&ft<CR>

" my maps
" nmap ; :

"text bubbling
nmap <C-Up> [e
nmap <C-Down> ]e
"bubbling multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

let g:gitgutter_sign_added = '+ '
let g:gitgutter_sign_modified = 'm '
let g:gitgutter_sign_removed = '- '
let g:gitgutter_sign_removed_first_line = '^ '
let g:gitgutter_sign_modified_removed = '-m'


" FORMATTERS js/ts
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css


let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint']
\}

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['tslint'],
  \    'typescriptreact': ['tslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier']
\}
let g:ale_fix_on_save = 1

nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error
