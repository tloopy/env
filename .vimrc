set shell=/opt/homebrew/bin/fish
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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set ttimeout 
set ttimeoutlen=1
set listchars=tab:>=,trail:~,extends:>,precedes:<,space:.
set ttyfast

call plug#begin('~/.config/nvim/autoload')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
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
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'
call plug#end()

" let g:onedark_config = {
"     \ 'style': 'darker',
" \}
" 
" colorscheme onedark
" hi Normal guibg=#222226 

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italicize_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

" hi CocFloating guifg=#c0c0c0 guibg=#080808 
" hi PmenuSel guibg=#ffffff guifg=#000000
" Change error colors
" :highlight CocErrorFloat ctermfg=color


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
" Select inside block
nnoremap <leader>vc vi{
nnoremap <leader>vp vi(
nnoremap <leader>vt vit
nnoremap <leader>va ggVG
nnoremap <leader>fa ggVG==
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
hi jsxComponentName guifg=#afd0b3 gui=bold
hi tsxCloseComponentName guifg=#E06C75 gui=bold
" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic gui=italic
" react
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66

hi Visual guibg=#224488

let g:NERDTreeIgnore = ['^build$', '^node_modules$', '^lib$', '^Pods$']

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

let g:indentLine_char_list = ['┆']

highlight CursorLine guibg=#383838 gui=bold
highlight CursorLineNr guifg=#cccc00 gui=bold
set cursorline

let g:vim_json_conceal=0
let g:vim_jsx_pretty_colorful_config = 1
