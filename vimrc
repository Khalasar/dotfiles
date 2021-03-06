set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
set hls
set sw=2 ts=2 sts=2 et
set number
set visualbell
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set encoding=utf8 fileencoding=utf8
let mapleader=","

" non-visible chars
set list
set listchars=tab:▸\ ,trail:.,extends:<,precedes:>,eol:·,nbsp:⋅
nmap <leader>l :set list!<CR>
nmap <leader>W :KillWhitespace<CR>
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>
" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

nmap <leader>t :Files<CR>
nmap <leader>b :Buffers<CR>

" map resizing of window
nmap <C-w>? :resize<CR>

set rtp+=~/.fzf

map yc zc

" Fonts
set guifont=inconsolata\ 13

" statusline
set laststatus=2

" splits
set splitbelow
set splitright

" pathogen
execute pathogen#infect()

" gem-ctags
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(pathogen#split(&tags) + map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))

" do not highlight vim gutter on the right
highligh clear SignColumn

" fugitive leader mappings
nmap <leader>gd :Gdiff<CR>
nmap <leader>gst :Gstatus<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>gca :Gcommit -av<CR>
nmap <leader>gaa :Git add --all<CR>
nmap <leader>gp :Git push<CR>

" Spell checking
" See http://robots.thoughtbot.com/vim-spell-checking/
autocmd FileType gitcommit setlocal spell
set complete+=kspell

nnoremap <F3> :set nospell!<CR>

" highlight lines longer than 80 chars
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FF0000
match OverLength /\%>80v.\+/

" file completion
" See http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names/526881#526881
set wildmode=longest,list,full
set wildmenu

" Elm
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>
let g:elm_format_autosave = 1

" Crystal
let g:crystal_define_mappings=0
autocmd FileType crystal nmap <F2> :CrystalSpecRunCurrent<CR>
autocmd FileType crystal nmap <S-F2> :CrystalSpecRunAll<CR>

set runtimepath^=~/.vim/bundle/ag

colorscheme railscasts

highligh clear SignColumn

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 1

autocmd bufwritepost *.js silent !standard --fix %
set autoread

" Allow vim-gitgutter to show git history sign immediately
set updatetime=100

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
