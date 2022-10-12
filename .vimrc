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
Plug 'Yggdroot/indentLine'
call plug#end()

let g:onedark_config = {
    \ 'style': 'darker',
\}

colorscheme onedark

:lua require("telescope").setup{defaults = { file_ignore_patterns= {"node_modules", "lib", "Pods", "coverage", "ios", "android"}}}

let mapleader = " "

nnoremap <leader>fe :NERDTree<cr>
nnoremap <leader>kw :only<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" Change the entire file contents
nnoremap <leader>ca ggVGc
" Yank the entire file to system clipboard
nnoremap <leader>ya ggVG"+y
" Run the current file in node
nnoremap <leader>nr :w<cr>:!node %:p<cr>
" Spotify 
nnoremap <leader>pl :!play 
nnoremap <leader>vl :!vol 
nnoremap <leader>sps :!pause<cr> 

" Clear search on enter
nnoremap <CR> :noh<CR><CR>

" Switch window panes
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

let g:NERDTreeIgnore = ['^build$', '^node_modules$', '^lib$', '^Pods$']

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
hi Normal guibg=NONE ctermbg=NONE

let g:indentLine_char_list = ['┆']

highlight CursorLineNr guifg=#EECC77 gui=bold
set cursorline

:highlight CocFloating guifg=#a0a0a0 guibg=#181820 
hi PmenuSel guibg=#555566 guifg=#000000
" Change error colors
" :highlight CocErrorFloat ctermfg=color
