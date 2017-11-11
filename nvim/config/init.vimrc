call plug#begin('~/.config/nvim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'mattn/emmet-vim'

Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'

call plug#end()


let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
			\  'javascript.jsx' : {
			\      'extends' : 'jsx',
			\  },
			\}

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
