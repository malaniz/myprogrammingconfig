call plug#begin()

"taskwiki
Plug 'tbabej/taskwiki'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'majutsushi/tagbar'
Plug 'farseer90718/vim-taskwarrior'


Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'

Plug 'skywind3000/asyncrun.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'isRuslan/vim-es6'

Plug 'kien/ctrlp.vim'
"Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

" eye candy
Plug 'myusuf3/numbers.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer', { 'on': 'ColorToggle' }
Plug 'wavded/vim-stylus'

" coffescript
Plug 'mtscout6/vim-cjsx'
Plug 'kchmck/vim-coffee-script'
Plug 'godlygeek/tabular'

call plug#end()

" sql for moz
function! ExeSql()
  let g:sqlquery = @q
  if g:sqlquery == ""
    echo "no sql to execute"
    return 0
  endif

  call writefile(split(g:sqlquery, "\n"), "/tmp/sqltmp")

  if exists("g:my_run_buffer")
    set swb=usetab
    exec ":rightbelow sbuf " . g:my_run_buffer
  else
    bo new
    set buftype=nofile
    let g:my_run_buffer = bufnr("%")
  endif
  let mycmd = "%! cat /tmp/sqltmp | sql 2>&1 | grep -v Warning"
  exec mycmd
endfunction

" repl for moz
function! ExeRepl()
  let g:sqlquery = @q
  if g:sqlquery == ""
    echo "no repl to execute"
    return 0
  endif

  call writefile(substitute(g:sqlquery, "\n", "", ""), "/tmp/reqltmp")

  if exists("g:my_run_buffer")
    set swb=usetab
    exec ":rightbelow sbuf " . g:my_run_buffer
  else
    bo new
    set buftype=nofile
    let g:my_run_buffer = bufnr("%")
  endif
  let mycmd = "%! cd /home/malaniz/dev/moz/downtown/; coffee src/rethinkstream.coffee $(cat /tmp/reqltmp)"
  exec mycmd
endfunction



" CoffeeScript settings
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd FileType litcoffee runtime ftplugin/coffee.vim
let coffee_lint_options = '-f ~/.moz/coffeelint.json'

function! LintCoffee()
 :CoffeeLint! | cwindow
endfunction

autocmd BufWritePost *.coffee call LintCoffee()

" CtrlP
let g:ctrlp_prompt_mappings={'PrtClearCache()':['<Leader><F5>']}
let g:ctrlp_prompt_mappings={'PrtdeleteEnt()':['<Leader><F7>']}
let g:ctrlp_match_window='bottom,order:btt,min:2,max:25'
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

call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])


" Unix as standard file type
set ffs=unix,dos,mac

" Always utf8
set termencoding=utf-8
" set encoding=utf-8
set fileencoding=utf-8



" All status line configuration goes here

set cmdheight=1
set display+=lastline

" general config
set laststatus=2 " always show status line
set showtabline=2 " always show tabline
set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it

" airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1  " buffers at the top as tabs
" let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tmuxline#enabled=0
let g:airline_theme = 'base16_pop'
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

" tmuxline config
" let g:tmuxline_preset = {
"         \ 'a': '#S',
"         \ 'b': '#F',
"         \ 'c': '#W',
"         \ 'win': ['#I', '#W'],
"         \ 'cwin': ['#I', '#W'],
"         \ 'x': '#h',
"         \ 'y': '%b %d',
"         \ 'z': '%R'}
"


" map Leader
let mapleader = " "
" keep backward f search, remapping it to ,;
" nnoremap <Leader>; ,

" in-line scrolling
nmap <Leader>j gj
nmap <Leader>k gk


"sql
map <Leader>ss "qy:call ExeSql()<CR>
map <Leader>rdb "qy:call ExeRepl()<CR>

" buffer keys
nnoremap <Leader>bb :b#<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bf :bf<CR>
nnoremap <Leader>bl :bl<CR>
nnoremap <Leader>bw :w<CR>:bd<CR>
nnoremap <Leader>bd :bd!<CR>
" new buffer/tab
nnoremap <Leader>e :enew<CR>

" window keys
nnoremap <Leader>w< <C-w><
nnoremap <Leader>w> <C-w>>
nnoremap <Leader>w- <C-w>-
nnoremap <Leader>w+ <C-w>+
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wx :close<CR>

" %% to expand active buffer location on cmdline
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" CtrlP keys
nnoremap <Leader>pp :CtrlP<CR>
nnoremap <Leader>pf :CtrlP<CR>
nnoremap <Leader>pm :CtrlPMRUFiles<CR>
nnoremap <Leader>pr :CtrlPMRUFiles<CR>
nnoremap <Leader>pb :CtrlPBuffer<CR>


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
nmap ; :

