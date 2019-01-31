set number
set relativenumber
"set expandtab
set tabstop=4
set guifont=Monospace\ 16px
set linespace=1
filetype plugin on          " plugins are enabled
set hlsearch
set incsearch
set encoding=utf-8
syntax on
set listchars=eol:¬,trail:·,extends:>,precedes:<,space:-,tab:↓-
set list! "show unprintable simbols
set mps+=<:>
set showmatch
set confirm
set title "name of current buffer
set incsearch " поиск фрагмента по мере его набора
set smartindent
set splitright
set shiftwidth=4
"set copyindent
set autoindent 
set wrap
set linebreak
set foldmethod=syntax
set cursorcolumn
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=phpcomplete#CompletePHP
set dictionary+=/usr/share/dict/func
set dir=~/tmp
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 3
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1
let g:netrw_browse_split = 20
" let g:netrw_sort_direction=reverse
" let g:netrw_winsize = 25
let g:netrw_ftp_cmd="ftp -p"
let g:closetag_html_style=1
let g:netrw_localrmdir='rm -r'
autocmd VimEnter * source .vim/gp-service.vim 
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
"if version >= 703
"if exists('+colorcolumn')
"  set colorcolumn=80
"endif
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=60 columns=140
endif

set lines=80
set columns=150
set filetype=php
set laststatus=2
"set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ [:%{&ff}]\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]


function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor    
" Puts in the current git status
" if count(g:pathogen_disabled, 'Fugitive') < 1
" 	set statusline+=%{fugitive#statusline()}
" endif
"
" " Puts in syntastic warnings
" if count(g:pathogen_disabled, 'Syntastic') < 1  
"         set statusline+=%#warningmsg#
"         set statusline+=%{SyntasticStatuslineFlag()}
"         set statusline+=%*
" endif


                        
let php_sql_query=1
let php_htmlInStrings=1

colorscheme wwdc16
"color dracula
hi Normal ctermbg=black  "no background  in  the terminal vim
"colorscheme molokai
"colorscheme desert
hi Comment guifg=gray30 

"mapping

vmap <F2> "+y
vmap <F3> "+gP
imap <F3> <C-c>"+gP
nmap <F3> "+gP
nmap ev :tabedit $MYVIMRC <CR>
nmap ed :w <CR> :bd <CR> :source $MYVIMRC <CR> 
nmap <Leader>n :Vex <CR> :vertical res 30 <CR>
nmap <Leader>1 <C-w>l<S-z><S-z>:vertical res 120% <CR>
"nmap <Leader>1 :vertical res 100% <CR> <C-w>l :q <CR>
nmap <Leader>. 15<C-w>>
nmap <Leader>.. 55<C-w>>
nmap <Leader>, 15<C-w><
nmap <Leader>[ :set co-=15<CR>
nmap <Leader>] :set co+=15<CR>
imap <Leader>ec <Esc><S-a>echo"</br>";<Esc>
nmap <Leader><Tab> dd<S-o>
imap ;; <Esc>
vmap ;; <Esc>
"buffer only
nnoremap <leader>bo :call te#tools#buf_only('', '')<cr>
vmap <F12> <C-c>j<S-v>zz 
imap <leader>w (<Esc>lxea);
nmap <leader>s <S-%>x<C-o>x 
imap <leader>; <Esc><S-a>;<Esc>
imap <leader>c <Esc>yi<<S-$>a</<Esc>pa><Esc><C-%>i<CR><Tab><CR><Esc>k 
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr> 
"add the same close tab
" Split management
" nnoremap <silent> [b :bprevious<cr>
" nnoremap <silent> ]b :bnext<cr>
nmap <silent> <C-k> :exe "resize " . (winheight(0) * 3/2)<CR>
nmap <silent> <C-j> :exe "resize " . (winheight(0) * 2/3)<CR>
nmap <silent> <C-h> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nmap <silent> <C-l> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"machine autoritetparts.com.ua login ftpuser password pas
"


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'StanAngeloff/php.vim'
"Plug 'jelera/vim-javascript-syntax'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'jwalton512/vim-blade'
":PlugInstall


" Initialize plugin system
call plug#end()
"after the plugin have installed to apply comand  :source ~/.vimrc
"and :PlugInstall


" map <C-n> :NERDTreeToggle<CR>

" map <F6> :setlocal spell! spelllang=en_us<CR>
"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
au BufRead *.html set filetype=htmlm4
" autocmd FileType html inoremap ;1 <h1></h1><Enter><Enter><++><Esc>2kf<i
" autocmd FileType html inoremap ;2 <h2></h2><Enter><Enter><++><Esc>2kf<i
" autocmd FileType html inoremap ;3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html,php inoremap ;d <div<Space>class=""></div><Enter><Enter><++><Esc>2kf<i
" autocmd FileType html,php inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
" autocmd FileType html,php inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>F"i
" autocmd FileType html,php inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
" autocmd FileType html,php inoremap ;li <Esc>o<li></li><Esc>F>a
autocmd FileType html,php inoremap <Leader>' echo"</br>";

"snipMate — позволяет быстро вставить в документ текстовый шаблон с помощью ключевого слова
"vim-airline - добавляет красоты
"neocomplcache - автокомплит и мног очего ещё
set nocp                    " 'compatible' is not set
