" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'terryma/vim-multiple-cursors'

Plug 'preservim/nerdtree'

Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Java-completion
Plug 'artur-shaik/vim-javacomplete2'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'

call plug#end()

let g:lightline = {'colorscheme': 'wombat', }
set laststatus=2

set nocompatible

"vimwiki vimwiki.github.io
set nocompatible
filetype plugin on
syntax on


"mappings
map <C-y> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Ctrl-b to open Tagbar
map <C-b> :TagbarToggle<CR>

"nnoremap H gT
"nnoremap L gt

set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete command
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

"Set default font in mac vim and gvim
set guifont=Inconsolata\ for\ Powerline:h24
set cursorline    " highlight the current line
set visualbell    " stop that ANNOYING beeping
set wildmenu
set wildmode=list:longest,full

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a
" set ttymouse=xterm2

" Make searching better
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
set incsearch
set showmatch

" Softtabs, 2 spaces
"
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 200 characters is
set textwidth=200
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
" set splitbelow
set splitright

" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

"HTML Editing
set matchpairs+=<:>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
"Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Quicker window movement
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"update dir to current file
autocmd BufEnter * silent! cd %:p:h

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " autocmd BufRead *.jsx set ft=jsx.html
  " autocmd BufNewFile *.jsx set ft=jsx.html

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 200 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=200

  " Automatically wrap at 200 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=200
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass,less setlocal iskeyword+=-
augroup END


" TODO: Don't think I need this anymore? Pretty sure supertab handles it
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
 function! InsertTabWrapper()
     let col = col('.') - 1
     if !col || getline('.')[col - 1] !~ '\k'
         return "\<tab>"
     else
         return "\<c-p>"
     endif
 endfunction

" Don't forget to start deoplete let g:deoplete#enable_at_startup = 1 " Less spam let g:deoplete#auto_complete_start_length = 2 
" Use smartcase
let g:deoplete#enable_smart_case = 1

" Setup completion sources
let g:deoplete#sources = {}

" IMPORTANT: PLEASE INSTALL JAVACOMPLETE2  AND ULTISNIPS OR DONT ADD THIS LINE!
" =====================================

let g:deoplete#sources.java = ['jc', 'javacomplete2', 'file', 'buffer', 'ultisnips']

" =====================================

"use TAB as the mapping
 inoremap <silent><expr> <TAB>
     \ pumvisible() ?  "\<C-n>" :
         \ <SID>check_back_space() ? "\<TAB>" :
             \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
  let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
 endfunction "" }}}

" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0


" Setup compilers for languages
 let g:ale_linters = {
       \  'cs':['syntax', 'semantic', 'issues'],
       \  'python': ['pylint'],
       \  'java': ['javac']
       \ }

" Open when no files were speficied on vim launch

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

function! s:insert_new_day(property)
  let l:date = strftime('%y%m%d')
  let l:text = [
    \ l:date,
    \ '',
    \ '#-----------------------------------------------------------------------------------------------------------------------------------------------------------------#',
    \ ''
    \ ]
  execute "normal! o" . substitute(join(l:text, "\n"), '\C<TMPL>', a:property, 'g') . "\<Esc>"
endfunction
command! -nargs=1 NewDay :call <SID>insert_new_day(<q-args>)


function! s:insert_new_todo_date(property)
  let l:text = ['[] (<TMPL>)']
  execute "normal! o" . substitute(join(l:text, "\n"), '\C<TMPL>', a:property, 'g') . "\<Esc>"
endfunction
command! -nargs=1 NewTodoDate :call <SID>insert_new_todo_date(<q-args>)

function! s:insert_new_todo()
  let l:text = ['[]             ']
  execute "normal! i" . join(l:text, ""). "\<Esc>"
endfunction
command! NewTodo :call <SID>insert_new_todo()

function! s:insert_new_todo_today()
  let l:date = strftime("%y%m%d")
  let l:text = ['[] ']
  let l:out=$l:text.$l:date
  execute "normal! i" . join(l:out, "") . "\<Esc>"
endfunction
command! NewTodoToday :call <SID>insert_new_todo_today()

nmap <Leader>wdn <Plug>VimwikiMakeDiaryNote

au BufNewFile ~/*.md
  \ call append(0,[
    \ "# " . split(expand('%:r'),'/')[-1], "",
  \ "## Daily checklist", "",
  \ "- [ ] Geekbot", "",
  \ "## Todo",  "",
  \ "## Unplanned",  "",
  \ "## Near Future",  "",
  \ "## Push",  "",
  \ "## Notes"])
