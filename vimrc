" install vim-plug if needed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on
syntax enable
filetype plugin on
set number
"speed boost
set hidden
set history=100
set hlsearch
set incsearch
set showmatch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
let g:airline_powerline_fonts = 1

"indentation rules
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

"latex
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

"RG
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
"if things are fucked up in tmux, swap the above for this
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

"evil mode
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" ===============
" Key mappings
" ===============

let mapleader=","
map <leader>s :source ~/.vimrc<CR>
map ; :
noremap <space> ?

"fzf config
"add namespace for fzf.vim exported commands
let g:fzf_command_prefix = 'Fzf'
"[buffers] jump to the existing window if possible
let g:fzf_buffers_jump =1
"use preview when FzfFiles is in full screen
command! -nargs=? -bang -complete=dir FzfFiles
      \ call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : {}, <bang>0)
command FzfChanges call s:fzf_changes()

nnoremap <silent> <leader>o :FzfFiles<CR>
nnoremap <silent> <leader>O :FzfFiles!<CR>
"filepath completion in insetmode
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

" ===============
" Plugins
" ===============
call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'unfog-io/unfog-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
"=============================
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"=============================
Plug 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>
"=============================
Plug 'raimondi/delimitmate'
Plug 'ajh17/vimcompletesme'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'cakebaker/scss-syntax.vim'
"=============================
Plug 'othree/csscomplete.vim'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
"=============================
Plug 'kien/ctrlp.vim'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/matchit.zip'
Plug 'hail2u/vim-css3-syntax'
Plug 'kabbamine/gulp-vim'
Plug 'junegunn/limelight.vim'
Plug 'gisraptor/vim-lilypond-integrator'
Plug 'spf13/piv'
Plug 'lumiliet/vim-twig'
Plug 'lifepillar/vim-cheat40'
Plug 'bling/vim-bufferline'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'yuttie/comfortable-motion.vim'
Plug 'prettier/vim-prettier'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()
colorscheme gruvbox
set background=dark
