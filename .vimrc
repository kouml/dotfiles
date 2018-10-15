set number
set cursorline
set cursorcolumn
highlight CursorColumn ctermbg=0
set wildmode=longest,full
set smartindent
set laststatus=2
nnoremap j gj
nnoremap k gk
" set list listchars=tab:\▸\-
" set shiftwidth=2
" set tabstop=2

set hlsearch
set wrapscan
set incsearch

inoremap <C-e> <Esc>$
inoremap <C-a> <Esc>^
noremap <C-e> <Esc>$
noremap <C-a> <Esc>^
set fenc=utf-8
set nobackup
set showcmd

imap <c-j> <esc>
let OSTYPE = system('uname')
if OSTYPE == "Darwin\n"
  :set term=xterm-256color
  :syntax on
endif


" normal mode
noremap <C-b> <Left>
noremap <C-f> <Right>

" insert mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill()<CR>

function! s:home()
  let start_column = col('.')
  normal! ^
  if col('.') == start_column
  ¦ normal! 0
  endif
  return ''
endfunction

function! s:kill()
  let [text_before, text_after] = s:split_line()
  if len(text_after) == 0
  ¦ normal! J
  else
  ¦ call setline(line('.'), text_before)
  endif
  return ''
endfunction

function! s:split_line()
  let line_text = getline(line('.'))
  let text_after  = line_text[col('.')-1 :]
  let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before, text_after]
endfunction

set clipboard=unnamed,autoselect

