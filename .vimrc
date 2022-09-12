set shell=/usr/local/bin/fish
" set termguicolors

syntax on
set number
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set incsearch
set splitright
set splitbelow
set colorcolumn=80
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set ttimeout 
set ttimeoutlen=1
set listchars=tab:>=,trail:~,extends:>,precedes:<,space:.
set ttyfast

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'tomasr/molokai'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'navarasu/onedark.nvim'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

let g:onedark_config = {
    \ 'style': 'warmer',
\}
colorscheme onedark

:lua require("telescope").setup{defaults = { file_ignore_patterns= {"node_modules", "lib", "Pods", "coverage", "ios", "android"}}}

let mapleader = " "

nnoremap <leader>fe :NERDTree<cr>
nnoremap <leader>kw :only<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <CR> :noh<CR><CR>

noremap <C-h> <C-w>h<cr>
noremap <C-j> <C-w>j<cr>
noremap <C-k> <C-w>k<cr>
noremap <C-l> <C-w>l<cr>

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)

let g:one_allow_italics = 1

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" dark red
hi tsxTagName guifg=#E06C75 gui=bold
hi tsxComponentName guifg=#E06C75 gui=bold
hi tsxCloseComponentName guifg=#E06C75 gui=bold

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic gui=italic

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66

hi PmenuSel guifg=#F0F0F0 guibg=#606060

let g:NERDTreeIgnore = ['^build$', '^node_modules$', '^lib$', '^Pods$']

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber


let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#323238
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#2a2a2d

