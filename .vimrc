""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" my plugins
Plugin 'The-NERD-Tree'
Plugin 'tikhomirov/vim-glsl'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:NERDChristmasTree=1
let g:NERDTreeWinPos='right'
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#ycm#enabled=1
let g:airline#extensions#ycm#error_symbol='❌'
let g:airline#extensions#ycm#warning_symbol='⛳'

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>tl :TagbarToggle<CR>

if !&diff
  Plugin 'DirDiff.vim'
  Plugin 'Valloric/YouCompleteMe'
  "Plugin 'jeaye/color_coded'
  Plugin 'junegunn/goyo.vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'marijnh/tern_for_vim'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'rdnetto/YCM-Generator'

  let g:goyo_width='60%'
  let g:goyo_height='100%'
  let g:tagbar_autofocus=1
  let g:tagbar_foldlevel=1
  let g:tagbar_left=1
  let g:tagbar_sort=0
  let g:vim_markdown_folding_disabled=1
  let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
  let g:ycm_confirm_extra_conf=0
  let g:ycm_seed_identifiers_with_syntax=1
  let g:ycm_collect_identifiers_from_tags_files=0
  let g:ycm_error_symbol='❌'
  let g:ycm_warning_symbol='⛳'
  let g:ycm_filetype_blacklist={'mkd.markdown' : 1, 'text' : 1}
  let g:ycm_server_python_interpreter='/usr/local/bin/python3'
  let g:ycm_key_invoke_completion='<C-]>'
  nnoremap <leader>dfm :Goyo<CR>
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  nnoremap <leader>jf :YcmCompleter GoToInclude<CR>
endif

" colorschemes
Plugin 'NewProggie/NewProggie-Color-Scheme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ayu-theme/ayu-vim'
Plugin 'baycomb'
Plugin 'blackboard.vim'
Plugin 'bluegreen'
Plugin 'candycode.vim'
Plugin 'desertedocean.vim'
Plugin 'desertedoceanburnt'
Plugin 'dracula/vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'marklar.vim'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'pacific.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vividchalk'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" my settings
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType python set ts=2 sts=2 sw=2
au FileType tex,plaintex,markdown nnoremap <F4> :call ConfigureTex()
au OptionSet background let ayucolor=v:option_new

if has('gui_running')
  au ColorScheme * highlight VertSplit gui=none guifg=fg guibg=bg
  au ColorScheme * highlight FoldColumn guifg=fg guibg=bg
  au ColorScheme * highlight SignColumn guifg=fg guibg=bg
  au ColorScheme newproggie highlight TabLineSel gui=bold guifg=#F7F7F7 guibg=#1E1E1E
endif

colorscheme evening
set background=dark
set backspace=indent,eol,start
set cindent
set expandtab
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set guioptions=
set guifont=fantasque\ sans\ mono\ 12
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linespace=1
set mouse-=a
set nowrap
set shiftwidth=2
set showcmd
set smartindent
set softtabstop=2
set tabstop=2
set t_Co=256
set wildignorecase
syntax enable

inoremap <A-O> <Esc>:b 
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <A-O> :b 
nnoremap <S-x> <C-w>c
nnoremap <leader>f :!find ./ -type f \! -name '.*' \| xargs grep -n '\<\>'<Left><Left><Left><C-r><C-w>
nnoremap <leader>nsp :call NoListSpace()<CR>
nnoremap <leader>o :call ToggleHeader()<CR>
nnoremap <leader>r :%s/\<<C-r><C-w>\>\C//g<Left><Left>
nnoremap <leader>sp :call ListSpace()<CR>
vnoremap <C-c> "+y
vnoremap <C-v> "+p

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
  set ambiwidth=double
endif

if has('gui_running')
  set lines=45
  set columns=140
  set cursorline
  set fillchars=fold:-
endif

if &diff
  colorscheme github
  set nonumber
  let g:airline_theme='zenburn'
endif

func! ConfigureTex()
  nnoremap j gj
  nnoremap k gk
  nnoremap 0 g0
  nnoremap $ g$
  set wrap
  set nocursorline
  set nonumber
  set guifont=fantasque\ sans\ mono\ 17
  set guifontwide=fznewshusong-z10\ 17
  set lsp=4
  nnoremap <F5> :silent !make 1>/dev/null 2>/dev/pts/0 &<CR>
endfun

func! ListSpace()
  set list
  set lcs=trail:⋅
endfun

func! NoListSpace()
  set nolist
endfunc

func! ToggleHeader()
  let header_extensions = ['h', 'hpp', 'hh', 'hxx']
  let source_extensions = ['cpp', 'cc', 'cxx', 'c', 'm', 'mm', 'metal', 'cu']
  let root_name = expand('%:p:r')
  let extension = expand('%:e')
  if index(header_extensions, extension) != -1
    for exname in source_extensions
      let filename = root_name.'.'.exname
      if filereadable(filename)
        execute 'edit' fnameescape(filename)
        break
      endif
    endfor
  elseif index(source_extensions, extension) != -1
    for exname in header_extensions
      let filename = root_name.'.'.exname
      if filereadable(filename)
        execute 'edit' fnameescape(filename)
        break
      endif
    endfor
  endif
endfunc
