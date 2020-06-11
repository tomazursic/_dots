"   ------------------------------------------------------------
"   file: .vimrc
"
"   Version: 2.1 Rainbow
"
"   === FIND HELP ===
"   :help!
"   :help 42
"   :Ni!
"   :help UserGettingBored
"   :help help
"   :help holy-grail
"   :smile
"
"   ------------------------------------------------------------

"{ BUILTIN OPTIONAL PLUGINS
" Activate matchit plugin
runtime! macros/matchit.vim

" Activate man page plugin
runtime! ftplugin/man.vim
"}

"{ BUILTIN OPTIONS AND SE TTINGS
if !has('nvim')
    " Change cursor shapes based on whether we are in insert mode,
    " see https://vi.stackexchange.com/questions/9131/i-cant-switch-to-cursor-in-insert-mode
    let &t_SI = "\<esc>[6 q"
    let &t_EI = "\<esc>[2 q"
    if exists("&t_SR")
        let &t_SR = "\<esc>[4 q"
    endif

    " The number of color to use
    set t_Co=256
endif

filetype plugin indent on
syntax enable

" Set height of status line
set laststatus=2

" Changing fillchars for folding, so there is no garbage charactes
set fillchars=fold:\ ,vert:\|

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://goo.gl/vHvyu8 for more info
set timeoutlen=500

" For CursorHold events
set updatetime=800

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://goo.gl/YAHBbJ
set clipboard+=unnamedplus

" Disable creating swapfiles, see https://goo.gl/FA6m6h
set noswapfile

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」

" Show line number and relative line number
set number

" File and script encoding settings for vim
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
scriptencoding utf-8

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=↪

" do not wrap long lines by default
set nowrap

" Don't highlight current cursor line
set nocursorline
" Show current line where the cursor is
" set cursorline

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
" set noruler

" List all items and start selecting matches in cmd completion
set wildmode=list:full

" Set a ruler at column 80, see https://goo.gl/vEkF5i
" set colorcolumn=80

" Use mouse to select and resize windows, etc.
" if has('mouse')
"     set mouse=nv  " Enable mouse in several mode
"     set mousemodel=popup  " Set the behaviour of mouse
" endif

" Do not show mode on command line since vim-airline can show it
set noshowmode

" Fileformats to use for new files
set fileformats=unix,dos

" The mode in which cursorline text can be concealed
set concealcursor=nc

" The way to show the result of substitution in real time for preview
if exists("&inccommand")
    set inccommand=nosplit
endif

" Ignore certain files and folders when globbing
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Do not use visual and error bells
set novisualbell noerrorbells

" The level we start to fold
" zr - open all folds
" zm - folds all
" za - fold current block
" :set nofoldenable - disable
set foldlevel=0

" The number of command and search history to keep
set history=500

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:+

" Auto-write the file based on some condition
set autowrite

" Show hostname, full path of file and last-mod time on the window title.
" The meaning of the format str for strftime can be found in
" http://tinyurl.com/l9nuj4a. The function to get lastmod time is drawn from
" http://tinyurl.com/yxd23vo8
set title
set titlestring=
set titlestring+=%(%{hostname()}\ \ %)
set titlestring+=%(%{expand('%:p')}\ \ %)
set titlestring+=%{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

" Persistent undo even after you close a file and re-open it.
" For vim, we need to set up an undodir so that $HOME is not cluttered with
" undo files.
if !has('nvim')
    if !isdirectory($HOME . "/.local/vim/undo")
        call mkdir($HOME . "/.local/vim/undo", "p", 0700)
    endif
    set undodir=~/.local/vim/undo
endif
set undofile

" Completion behaviour
set completeopt+=menuone  " Show menu even if there is only one item
set completeopt-=preview  " Disable the preview window

" Settings for popup menu
set pumheight=15  " Maximum number of items to show in popup menu
if exists("&pumblend")
    set pumblend=5  " Pesudo blend effect for popup menu
endif

" Scan files given by `dictionary` option
set complete+=k,kspell complete-=w complete-=b complete-=u complete-=t

" faster redrawing.
set ttyfast

" only redraw when aecessary.
set lazyredraw

" Don't bell or blink
set noerrorbells

" Disable all bells.  I hate ringing/flashing.
set vb t_vb=

" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://tinyurl.com/y5n87a6m
set shiftround

" Virtual edit is useful for visual block edit
set virtualedit=block

" Correctly break multi-byte characters such as CJK,
" see http://tinyurl.com/y4sq6vf3
set formatoptions+=mM

" Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
set tildeop

" Do not add two space after a period when joining lines or formatting texts,
" see https://tinyurl.com/y3yy9kov
set nojoinspaces

" Text after this column is not highlighted
set synmaxcol=500

" Higlites searches
set hls

" Increment search
set incsearch

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

set wildmenu

" Do not use corsorcolumn
set nocursorcolumn
"}

" { FUNCTIONS
" Remove trailing white space, see https://vi.stackexchange.com/a/456/15292
function! StripTrailingWhitespaces() abort
    let l:save = winsaveview()
    keeppatterns %s/\v\s+$//e
    call winrestview(l:save)
endfunction

" Custom fold expr, adapted from https://vi.stackexchange.com/a/9094/15292
function! VimFolds(lnum)
    " get content of current line and the line below
    let l:cur_line = getline(a:lnum)
    let l:next_line = getline(a:lnum+1)

    if l:cur_line =~# '^"{'
        return '>' . (matchend(l:cur_line, '"{*') - 1)
    else
        if l:cur_line ==# '' && (matchend(l:next_line, '"{*') - 1) == 1
            return 0
        else
            return '='
        endif
    endif
endfunction

" Custom fold text, adapted from https://vi.stackexchange.com/a/3818/15292
" and https://vi.stackexchange.com/a/6608/15292
function! FoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = &textwidth - len(line_text) - len(folded_line_num) - 10
    return '+'. repeat('-', 4) . line_text . repeat('.', fillcharcount) . ' ('. folded_line_num . ' L)'
endfunction
"}

"{ VARIABLES
let mapleader = ','

" === NETWR ===
" https://github.com/bling/dotvim/issues/4
" let g:loaded_netrwPlugin = 1

" Hide by defualt dots files
let g:netrw_hide = 1

" Setup for using build-in file explorer
" Set tree mode
let g:netrw_liststyle = 3
" Remove banner
let g:netrw_banner = 0
" Changing how files are opened
" 1 - open files in a new horizontal split
" 2 - open files in a new vertical split
" 3 - open files in a new tab
" 4 - open in previous window
" let g:netrw_browse_split = 1
" let g:netrw_browse_split = 4
" Set the width of the directory explorer
let g:netrw_winsize = 25
" let g:netrw_altv = 1

" Do not load tohtml.vim
let g:loaded_2html_plugin = 1

" Using netwr like a basic scrooloose/nerdtree, but plugin-free
function! ToggleTree()
  if exists("t:expl_buf_num")
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      let cur_win_nr = winnr()
      exec expl_win_num . 'wincmd w'
      close
      exec cur_win_nr . 'wincmd w'
      unlet t:expl_buf_num
    else
      unlet t:expl_buf_num
    endif
  else
    exec '1wincmd w'
    Vexplore
    let t:expl_buf_num = bufnr("%")
  endif
endfunction

map <leader>- :call ToggleTree()<CR>
"}

"{ AUTO COMMANDS
" disable automatic comment prefixing
augroup configgroup
    autocmd!
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o
augroup END

" Do not use smart case in command line mode,
" extracted from https://goo.gl/vCTYdK
if exists("##CmdLineEnter")
    augroup dynamic_smartcase
        autocmd!
        autocmd CmdLineEnter : set nosmartcase
        autocmd CmdLineLeave : set smartcase
    augroup END
endif

" Set textwidth for text file types
augroup text_file_width
    autocmd!
    " Sometimes, automatic filetype detection is not right, so we need to
    " detect the filetype based on the file extensions
    autocmd BufNewFile,BufRead *.md,*.MD,*.markdown setlocal textwidth=79
augroup END

if exists("##TermOpen")
    augroup term_settings
        autocmd!
        " Do not use number and relative number for terminal inside nvim
        autocmd TermOpen * setlocal norelativenumber nonumber
        " Go to insert mode by default to start typing command
        autocmd TermOpen * startinsert
    augroup END
endif

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Return to last edit position when opening a file
augroup resume_edit_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | execute "normal! g`\"zvzz"
        \ | endif
augroup END

" Display a message when the current file is not in utf-8 format.
" Note that we need to use `unsilent` command here because of this issue:
" https://github.com/vim/vim/issues/4379. For older Vim (version 7.4), the
" help file are in gzip format, do not warn this.
augroup ugroup non_utf8_file_warn
    autocmd!
    autocmd BufRead * if &fileencoding != 'utf-8' && expand('%:e') != 'gz'
                \ | unsilent echomsg 'File not in UTF-8 format!' | endif
augroup END

augroup vimfile_setting
    autocmd!
    autocmd FileType vim setlocal foldmethod=expr foldlevel=0 foldlevelstart=-1
    \ foldexpr=VimFolds(v:lnum) foldtext=FoldText()
    \ keywordprg=:help formatoptions-=o formatoptions-=r
augroup END
"}

"{ CUSTOM KEY MAPPINGS
" Save key strokes (now we do not need to press shift to enter command mode).

" Forget arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Get rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nmap <F1> <ESC>
vnoremap <F1> <ESC>

" Double jj in insert mode act as ESC
inoremap jj <Esc>

" Remap accidentally title W into lower w
noremap :W :w

" Remap accidentally title Q! into lower q!
noremap :Q! :q!

" Split navigation - ctrl-jklm changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Tabs setup
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" Clear search matches higlites on CTRL-l (line 30 not working correctly)
nnoremap <silent><C-L> :nohlsearch<CR>
" Toggle search highlight, see https://goo.gl/3H85hh
" nnoremap <silent><expr> <Leader>hl (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Remove trailing whitespace characters
" nmap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <silent> <leader>S :call StripTrailingWhitespaces()<CR>

" Remove windows' end of line
nmap <leader>mm :%s/^M$//g<CR>

" toggle wrap mode
nmap <leader>wr :setlocal wrap!<CR>:setlocal wrap?<CR>

" Save as sudo :w!!
cmap w!! w !sudo tee % >/dev/null

" Visual select pasted
nmap gV `[v`]

" Execute q macro
nmap Q @q

" Make current file executable
nmap <leader>X :!chmod +x %<CR>

" Turn the word under cursor to upper case (inset mode CTRL + u)
inoremap <silent> <c-u> <Esc>viwUea

" Turn the current word into title case (inset mode CTRL + t)
inoremap <silent> <c-t> <Esc>b~lea

" Navigation in the location and quickfix list
nnoremap [l :lprevious<CR>zv
nnoremap ]l :lnext<CR>zv
nnoremap [L :lfirst<CR>zv
nnoremap ]L :llast<CR>zv
nnoremap [q :cprevious<CR>zv
nnoremap ]q :cnext<CR>zv
nnoremap [Q :cfirst<CR>zv
nnoremap ]Q :clast<CR>zv

" Close location list or quickfix list if they are present,
" see https://goo.gl/uXncnS
nnoremap <leader>qc :windo lclose <bar> cclose<CR>

" Insert a blank line below or above current line (do not move the cursor),
" see https://stackoverflow.com/a/16136133/6064933
nnoremap <expr> oo 'm`' . v:count1 . 'o<Esc>``'
nnoremap <expr> OO 'm`' . v:count1 . 'O<Esc>``'

" Yank from current cursor position to the end of the line (make it
" consistent with the behavior of D, C)
nnoremap Y y$

" Move the cursor based on physical lines, not the actual lines.
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> ^ g^
nnoremap <silent> 0 g0

" Do not include white space characters when using $ in visual mode,
" see https://goo.gl/PkuZox
xnoremap $ g_

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" Resize windows using <Alt> and h,j,k,l, inspiration from
" https://goo.gl/vVQebo (bottom page).
" If you enable mouse support, shorcuts below may not be necessary.
nnoremap <silent> <M-h> <C-w><
nnoremap <silent> <M-l> <C-w>>
nnoremap <silent> <M-j> <C-W>-
nnoremap <silent> <M-k> <C-W>+

" Continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://goo.gl/m1UeiT
xnoremap < <gv
xnoremap > >gv

" When completion menu is shown, use <cr> to select an item
" and do not add an annoying newline. Otherwise, <enter> is what it is.
" For more info , see https://goo.gl/KTHtrr and https://goo.gl/MH7w3b
inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
" Use <esc> to close auto-completion menu
inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))

" Brings up configuration with ,ev
map <leader>ev :e $HOME/.vimrc<CR>
" Reload configuration ,sv
map <silent><leader>sv :source $HOME/.vimrc<CR> :echo 'Reloaded .vimrc!'<CR>

" Search and replace visual selected trigger CTRL-r
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" search and replace CTRL + s
nnoremap <C-s> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/

" search and replace with confirmation CTRL + h
nnoremap <C-h>       :%s/\<<C-r>=expand("<cword>")<CR>\>//gc<left><left><left>

" Adjusting indentation rules manually
command! -nargs=1 Spaces execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " expandtab" | set shiftwidth? softtabstop? expandtab?
command! -nargs=1 Tabs   execute "setlocal shiftwidth=" . <args> . " softtabstop=" . <args> . " noexpandtab" | set shiftwidth? softtabstop? expandtab?

" CHECK this if its working
" Change current working directory locally and print cwd after that,
" see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
" nnoremap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Set working directory to current open file location
nmap <leader>. :lcd %:p:h<CR>:cd .<CR>

" Use Esc to quit builtin terminal
if exists(":tnoremap")
    tnoremap <ESC>   <C-\><C-n>
endif

" Decrease indent level in insert mode with shift+tab
inoremap <S-Tab> <ESC><<i

" Change text without putting the text into register,
" see http://tinyurl.com/y2ap4h69
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" Datetime mappings
nmap <leader>dt i<C-R>=strftime("%Y-%m-%d %H:%m")<CR><Esc>
imap <leader>dt <C-R>=strftime("%Y-%m-%d %H:%m")<CR>

" 'quote' a word
nnoremap <leader>' :silent! normal mpea'<Esc>bi'<Esc>`pl
" "double "quote" a word
nnoremap <leader>" :silent! normal mpea"<Esc>bi"<Esc>`pl
" " remove quotes from a word
nnoremap dq :silent! normal mpeld bhd `ph<CR>

"autoclose with , and position cursor to write text inside
inoremap '<tab> ''<left>
inoremap `<tab> ``<left>
inoremap "<tab> ""<left>
inoremap (<tab> ()<left>
inoremap [<tab> []<left>
inoremap {<tab> {}<left>
inoremap <<tab> <><left>

" Create block and auto close brackets with pressing Enter
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Create jinja variable by hitting ,d
nnoremap <leader>bb a{{  }}<Left><Left><Left>
inoremap <leader>bb {{  }}<Left><Left><Left>

" comma then r, writes your current file, and runs python3 <name of file>, hit
" enter again after script completes to drop back into vim
nnoremap <leader>r :w<CR>:! python3 %<CR>

" The python debugger shortcut, while in insert mode
inoremap pdb<tab> import pdb; pdb.set_trace()

" Open pyhton documentation for word under cursor
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
"}

"{ CLIPBOARD
" Copy/Paste from system clipboard
" <leader>Y to get current line in clipboard
" <leader>y to get only visual selection in clipboard
" paset it with <SHIFT>Insert
vmap <leader>y "+y
nmap <leader>Y "*Y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" Toggle paste
set pastetoggle=<leader>x
"}

"{ BUFFERS
" https://vim.fandom.com/wiki/Easier_buffer_switching
" Back and fort last two buffers
nmap <leader>, <C-^>

" Close a buffer and switching to another buffer, do not close the
" window, see https://goo.gl/Wd8yZJ
" nnoremap <leader>q :bprevious <bar> bdelete #<CR>
nnoremap <leader>q :bd!<CR>

" Browse buffers
nnoremap <Leader><Enter> :buffers<CR>:buffer<Space>

" To move between buffers
nmap <leader>n :bnext<CR>
nmap <leader>m :bprevious<CR>

" new buffer from text
map gf :e <cfile><CR>

" Scratch buffer :SC
command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
"}

"{ SPELL CHECKING
" Shortcut to toggle spelling
noremap <leader>s :call Spelling()<CR>
nmap <leader>s :set spell! spelllang=en_gb<CR>
" Shortcuts using <leader>
" Jump to next error
map <leader>sn ]s
" Jump to previous error
map <leader>sp [s
" Add word to dict
map <leader>sa zg
" Show suggestions
map <leader>ss z=
" Select first correction from dict
map <leader>s. 1z=
"}

"{ UI SETTINGS
augroup EyeCandy
    autocmd!
    autocmd ColorScheme * call Highlights()
augroup END

function! Highlights() abort
    highlight clear

    " The following colors are taken from ayu_mirage vim-airline theme,
    " link: https://github.com/vim-airline/vim-airline-themes/
    hi User1 ctermfg=0 ctermbg=114
    hi User2 ctermfg=114 ctermbg=0

    " The following colors are taken from vim-gruvbox8,
    " link: https://github.com/lifepillar/vim-gruvbox8
    hi Normal ctermfg=187 ctermbg=NONE cterm=NONE
    hi CursorLineNr ctermfg=214 ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=102 ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=187 ctermbg=NONE cterm=NONE
    hi VertSplit ctermfg=59 ctermbg=NONE cterm=NONE

    hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE
    hi Comment ctermfg=102 ctermbg=NONE cterm=italic
    hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE
    hi Error ctermfg=203 ctermbg=234 cterm=bold,reverse
    hi ErrorMsg ctermfg=234 ctermbg=203 cterm=bold
    hi Folded ctermfg=102 ctermbg=237 cterm=italic
    hi LineNr ctermfg=243 ctermbg=NONE cterm=NONE
    hi MatchParen ctermfg=NONE ctermbg=59 cterm=bold
    hi NonText ctermfg=239 ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=187 ctermbg=239 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=239 cterm=NONE
    hi PmenuSel ctermfg=239 ctermbg=109 cterm=bold
    hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE
    hi SpecialKey ctermfg=102 ctermbg=NONE cterm=NONE
    hi StatusLine ctermfg=239 ctermbg=187 cterm=reverse
    hi StatusLineNC ctermfg=237 ctermbg=137 cterm=reverse
    hi TabLine ctermfg=243 ctermbg=237 cterm=NONE
    hi TabLineFill ctermfg=243 ctermbg=237 cterm=NONE
    hi TabLineSel ctermfg=142 ctermbg=237 cterm=NONE
    hi ToolbarButton ctermfg=230 ctermbg=59 cterm=bold
    hi ToolbarLine ctermfg=NONE ctermbg=59 cterm=NONE
    hi Visual ctermfg=NONE ctermbg=59 cterm=NONE
    hi WildMenu ctermfg=109 ctermbg=239 cterm=bold
    hi Conceal ctermfg=109 ctermbg=NONE cterm=NONE
    hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
    hi DiffAdd ctermfg=142 ctermbg=234 cterm=reverse
    hi DiffChange ctermfg=107 ctermbg=234 cterm=reverse
    hi DiffDelete ctermfg=203 ctermbg=234 cterm=reverse
    hi DiffText ctermfg=214 ctermbg=234 cterm=reverse
    hi Directory ctermfg=142 ctermbg=NONE cterm=bold
    hi EndOfBuffer ctermfg=234 ctermbg=NONE cterm=NONE
    hi IncSearch ctermfg=208 ctermbg=234 cterm=reverse
    hi ModeMsg ctermfg=214 ctermbg=NONE cterm=bold
    hi MoreMsg ctermfg=214 ctermbg=NONE cterm=bold
    hi Question ctermfg=208 ctermbg=NONE cterm=bold
    hi Search ctermfg=214 ctermbg=234 cterm=reverse
    hi SpellBad ctermfg=203 ctermbg=NONE cterm=italic,underline
    hi SpellCap ctermfg=109 ctermbg=NONE cterm=italic,underline
    hi SpellLocal ctermfg=107 ctermbg=NONE cterm=italic,underline
    hi SpellRare ctermfg=175 ctermbg=NONE cterm=italic,underline
    hi Title ctermfg=142 ctermbg=NONE cterm=bold
    hi WarningMsg ctermfg=203 ctermbg=NONE cterm=bold
    hi Boolean ctermfg=175 ctermbg=NONE cterm=NONE
    hi Character ctermfg=175 ctermbg=NONE cterm=NONE
    hi Conditional ctermfg=203 ctermbg=NONE cterm=NONE
    hi Constant ctermfg=175 ctermbg=NONE cterm=NONE
    hi Define ctermfg=107 ctermbg=NONE cterm=NONE
    hi Debug ctermfg=203 ctermbg=NONE cterm=NONE
    hi Delimiter ctermfg=208 ctermbg=NONE cterm=NONE
    hi Error ctermfg=203 ctermbg=234 cterm=bold,reverse
    hi Exception ctermfg=203 ctermbg=NONE cterm=NONE
    hi Float ctermfg=175 ctermbg=NONE cterm=NONE
    hi Function ctermfg=142 ctermbg=NONE cterm=bold
    hi Identifier ctermfg=109 ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=fg ctermbg=NONE cterm=NONE
    hi Include ctermfg=107 ctermbg=NONE cterm=NONE
    hi Keyword ctermfg=203 ctermbg=NONE cterm=NONE
    hi Label ctermfg=203 ctermbg=NONE cterm=NONE
    hi Macro ctermfg=107 ctermbg=NONE cterm=NONE
    hi Number ctermfg=175 ctermbg=NONE cterm=NONE
    hi Operator ctermfg=107 ctermbg=NONE cterm=NONE
    hi PreCondit ctermfg=107 ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=107 ctermbg=NONE cterm=NONE
    hi Repeat ctermfg=203 ctermbg=NONE cterm=NONE
    hi SpecialChar ctermfg=203 ctermbg=NONE cterm=NONE
    hi SpecialComment ctermfg=203 ctermbg=NONE cterm=NONE
    hi Statement ctermfg=203 ctermbg=NONE cterm=NONE
    hi StorageClass ctermfg=208 ctermbg=NONE cterm=NONE
    hi Special ctermfg=208 ctermbg=NONE cterm=italic
    hi String ctermfg=142 ctermbg=NONE cterm=italic
    hi Structure ctermfg=107 ctermbg=NONE cterm=NONE
    hi Todo ctermfg=fg ctermbg=234 cterm=bold,italic
    hi Type ctermfg=214 ctermbg=NONE cterm=NONE
    hi Typedef ctermfg=214 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=109 ctermbg=NONE cterm=underline
    hi CursorIM ctermfg=NONE ctermbg=NONE cterm=reverse

    hi Comment cterm=NONE
    hi Folded cterm=NONE
    hi SpellBad cterm=underline
    hi SpellCap cterm=underline
    hi SpellLocal cterm=underline
    hi SpellRare cterm=underline
    hi Special cterm=NONE
    hi String cterm=NONE
    hi Todo cterm=bold

    hi NormalMode ctermfg=137 ctermbg=234 cterm=reverse
    hi InsertMode ctermfg=109 ctermbg=234 cterm=reverse
    hi ReplaceMode ctermfg=107 ctermbg=234 cterm=reverse
    hi VisualMode ctermfg=208 ctermbg=234 cterm=reverse
    hi CommandMode ctermfg=175 ctermbg=234 cterm=reverse
    hi Warnings ctermfg=208 ctermbg=234 cterm=reverse
endfunction

if exists("&termguicolors")
    " If we want to use true colors, we must a color scheme which support true
    " colors, for example, https://github.com/sickill/vim-monokai
    set notermguicolors
endif
set background=dark
colorscheme desert

" Highlight trailing spaces and leading tabs
call matchadd('Warnings', '\s\+$')
call matchadd('Warnings', '^\t\+')

" statusline settings
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ '' : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

set statusline=
set statusline+=%1*
" Show current mode
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%{&spell?'[SPELL]':''}

set statusline+=%#Warnings#
set statusline+=%{&paste?'[PASTE]':''}

set statusline+=%2*
" File path, as typed or relative to current directory
set statusline+=\ %F

set statusline+=%{&modified?'\ [+]':''}
set statusline+=%{&readonly?'\ []':''}

" Truncate line here
set statusline+=%<

" Separation point between left and right aligned items.
set statusline+=%=

set statusline+=%{&filetype!=#''?&filetype.'\ ':'none\ '}

" Encoding & Fileformat
set statusline+=%#Warnings#
set statusline+=%{&fileencoding!='utf-8'?'['.&fileencoding.']':''}

set statusline+=%2*
set statusline+=%-7([%{&fileformat}]%)

" Warning about byte order
set statusline+=%#Warnings#
set statusline+=%{&bomb?'[BOM]':''}

set statusline+=%1*
" Location of cursor line
set statusline+=[%l/%L]

" Column number
set statusline+=\ col:%3c

" Warning about trailing spaces.
set statusline+=%#Warnings#
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{StatuslineTabWarning()}

" Recalculate the trailing whitespace warning when idle, and after saving.
augroup check_trailing_space
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning
        \ | let &statusline=&statusline
augroup END

augroup check_mixed_tabs
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:statusline_tab_warning
        \ | let &statusline=&statusline
augroup END

" Find if trailing spaces exist.
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        " If the file is unmodifiable, do not warn this.
        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        let l:line_num = search('\s\+$', 'nw')
        if l:line_num != 0
            let b:statusline_trailing_space_warning = ' [' . l:line_num . ']' . 'trailing space'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

" Find if they are mixed indentings.
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        " If the file is unmodifiable, do not warn this.
        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        let has_leading_tabs = search('^\t\+', 'nw') != 0
        let has_leading_spaces = search('^ \+', 'nw') != 0

        if has_leading_tabs && has_leading_spaces
            let b:statusline_tab_warning = ' [mixed-indenting]'
        elseif has_leading_tabs
            let b:statusline_tab_warning = ' [tabbed-indenting]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif

    return b:statusline_tab_warning
endfunction
"}
