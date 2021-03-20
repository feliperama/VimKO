source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/theme.vimrc
source $HOME/.config/nvim/config/mappings.vimrc

"NOT SURE, may be a problem for tsscript server
"I THINK is not necessary, let coc-tsserver and other plugins to made syntax
" au BufNewFile,BufRead *.jsx setlocal ft=html ft=javascript

set encoding=UTF-8
set hidden                   " hide buffers when abandoned instead of unload
set synmaxcol=1000           " Don't syntax highlight long lines
set colorcolumn=80,120
set spelllang=en

" set tags=./.tags


" Behavior
set number
set nowrap
set inccommand=nosplit
set nolist                " Show hidden characters
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:\ ,precedes:«,extends:»

" make all copy/cut save on clipboard also
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed 
else
  set clipboard=unnamedplus
endif

set foldmethod=indent
set foldlevelstart=99

" Appearance
set noshowmode          " Don't show mode in cmd window
set showtabline=1       " just if there is two tabs or more 
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set display=lastline
set cursorline

" Javascript Pretifier configuration
autocmd FileType javascript set formatprg=prettier\ --stdin

autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType typescript setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType java setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=
autocmd FileType snippets setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType php setlocal iskeyword-=-
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

" Tabs and Indents
set textwidth=80  " Text width maximum chars before wrapping
set expandtab     " Don't expand tabs to spaces.
set tabstop=2     " The number of spaces a tab is
set softtabstop=2 " While performing editing operations
set shiftwidth=2  " Number of spaces to use in auto(indent)
set smarttab      " Tab insert blanks according to 'shiftwidth'
set autoindent    " Use same indenting on new lines
set smartindent   " Smart autoindenting on new lines
set shiftround    " Round indent to multiple of 'shiftwidth'
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

" Searching {{{
" set ignorecase      " Search ignoring case
set noignorecase      " Search NO ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set nohlsearch        " Highlight search results
" opt1
" autocmd cursorhold * set nohlsearch
" autocmd cursormoved * set hlsearch
" opt2
" autocmd cursorhold * set nohlsearch
" noremap n :set hlsearch<cr>n
" noremap N :set hlsearch<cr>N
" noremap / :set hlsearch<cr>/
" noremap ? :set hlsearch<cr>?set wrapscan        " Searches wrap around the end of the file
" Smaller updatetime for CursorHold & CursorHoldI
noremap * :set hlsearch<cr>*
set updatetime=100
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed

" AutoClose for vim erb
let g:AutoClosePairs = { '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

set norelativenumber
" set relativenumber
" " switch to relative numbers in normal mode
" autocmd BufLeave * :set norelativenumber
" autocmd BufEnter * :set relativenumber
" autocmd InsertEnter * :set norelativenumber
" autocmd InsertLeave * :set relativenumber

" Groovy syntax highlighting for Jenkinsfiles
" au BufNewFile,BufRead Jenkinsfile set filetype=groovy

" Treat words with dash as a word
set iskeyword+=-
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4

function! ToggleVerbose()
    if !&verbose
        set verbosefile=~/.config/nvim/verbose.log
        set verbose=9
    else
        set verbose=0
        set verbosefile=
    endif
endfunction

" Checkbox toogler
fu! ToogleCheckbox()
	let line = getline('.')

  if(match(line, '\[.*\]') != -1)
    let states = [' ', 'x', 'n/a']

    if(match(line, '\[\]') != -1)
      let line = substitute(line, '\[\]', '[ ]', '')
    end

    for state in states
      if(match(line, '\[' . state . '\]') != -1)
        if state == 'n/a'
          let next_state = states[0]
        else
          let next_state = states[index(states, state) + 1]
        endif
        let line = substitute(line, '\[' . state . '\]', '[' . next_state . ']', '')
        break
      endif
    endfor
  else
    let line = substitute(line, '\<', '' . '[ ]' . ' ', '')
  endif

	call setline('.', line)
endf

