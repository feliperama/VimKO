" https://vim.fandom.com/wiki/Unused_keys
" -----------------------------------------------------------------------------
" Leaders
" -----------------------------------------------------------------------------
  let mapleader="\<space>"

  nnoremap  [FuzzyFinder]   <Nop>
  nmap      ; [FuzzyFinder]

  nnoremap  [Files]   <Nop>
  nmap      f [Files]
  " nmap      , [Files]

  nnoremap  [Windows]   <Nop>
  nmap      s [Windows]

  nnoremap  [Tabs]   <Nop>
  nmap      t [Tabs]

  nnoremap  [Terminal]   <Nop>
  nmap      ! [Terminal]

  nnoremap  [Git]   <Nop>
  nmap      g [Git]

  nnoremap  [Ruby]   <Nop>
  nmap      R [Ruby]
  vmap      R [Ruby]

  nnoremap  [Elixir]   <Nop>
  nmap      E [Elixir]
  vmap      E [Elixir]
" -----------------------------------------------------------------------------
" Miscellaneous
" -----------------------------------------------------------------------------

  " Break line eficiently
  " ref: https://stackoverflow.com/questions/18057421/vim-cursor-position-after-expanding-html-tag
  " inoremap <leader><CR> <CR><C-o>==<C-o>O
  inoremap <C-n> <CR><C-o>==<C-o>O

  " Reload command
  command! Reload :so ~/.config/nvim/init.vim

  " go to normal mode and save
  " inoremap ;w <Esc> :w<CR> :call RunTestsOnLeftPane(expand('%')) <CR>
  nnoremap ;w :w<CR>

  " Jump to alternate file
  nnoremap ;a :A<CR>

  " esc in insert mode
  " imap jk <Esc>
  " imap kj <Esc>

  " Highlight cursor word
  nmap <Leader>h <Plug>(quickhl-manual-this)
  xmap <Leader>h <Plug>(quickhl-manual-this)
  nmap <Leader>w <Plug>(quickhl-manual-this-whole-word)
  xmap <Leader>w <Plug>(quickhl-manual-this-whole-word)
  nmap <Leader>H <Plug>(quickhl-manual-reset)
  xmap <Leader>H <Plug>(quickhl-manual-reset)
  nmap <Leader>Z <Plug>(quickhl-manual-clear)
  xmap <Leader>Z <Plug>(quickhl-manual-clear)

  " Highlight selected lines
  function! HighlightRegion()
    hi Green guibg=#3c4554
    let l_start = line("'<")
    let l_end = line("'>")
    execute 'syntax region Green start=/\%3'.l_start.'/ end=/\%'.l_end.'l/'
  endfunction

  vnoremap <leader>y :<C-U>call HighlightRegion()<CR>

  " Checkbox
  nnoremap <silent> <leader>x :call ToogleCheckbox()<cr>
  xnoremap <silent> <leader>x :call ToogleCheckbox()<cr>
  nnoremap <leader>tcc :set cursorcolumn!<CR>

  " Indent file -> FIXME Temporalilly comment out due conflictwith vdebug
  " nnoremap <leader>e =ae<C-o>

  " Indent paragraph
  " nnoremap <leader>a =ip

  " Remove empty spaces
  nnoremap <leader>, :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR><C-o>

  " Overwrite word unders cursor
  nnoremap <leader>ow <Esc>viwp

  " Substitute all occurences in current file
  nnoremap <Leader>saw :%s/\<<C-r><C-w>\>//g<Left><Left>

  " FELIPE: Removed, * already do but forward instead of backward
  " Select all occurences of the word and display a counter
  " nnoremap * :%s/\<<C-r><C-w>\>//n<cr>0N

  " Substitute inside selection
  xnoremap s :s//g<Left><Left>

  " Select pasted text
  nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

  " FELIPE: removed, it was not adding anything good.
  " Workaround to fix the Next occurence direction
  " nnoremap N n
  " nnoremap n N

  " Yank until end of line
  nnoremap Y y$

  " Quite with q
  nnoremap <silent> q :<C-u>:quit<CR>

  " Recording 
  nnoremap <leader>q q

  " Toggle Tagbar
  nnoremap <leader>; :TagbarToggle<CR>

  " Open easy motion between panels
  nmap <silent> / <Plug>(easymotion-overwin-f2)

  " Paste without yank
  " vnoremap p "_dP

  " Change current word in a repeatable manner
  nnoremap cn *``cgn
  nnoremap cN *``cgN

  " Change selected word in a repeatable manner
  vnoremap <expr> cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
  vnoremap <expr> cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

  " Save with sudo (not working on neovim, workaround with plugin suda.vim)
  " cmap w!! w !sudo tee % >/dev/null
  cmap w!! SudaWrite

  cmap AC :call CreateAlternateFile()<CR>

  function! CreateAlternateFile()
    let alternate_file = projectionist#query_file('alternate')[0]
    exec "saveas  " . alternate_file
    exec "call projectionist#apply_template()"
  endfunction

  " Smart Duplication
  nnoremap <Leader>d :t.<cr>
  vnoremap <Leader>d :co-1<cr>

  " Line comment without move the cursor
  " TODO

  " Line cut/past without move the cursor
  nnoremap <Leader>xk :call CutAndPasteByLineNumber('-')<left><left>
  nnoremap <Leader>xj :call CutAndPasteByLineNumber('+')<left><left>

  function! CutAndPasteByLineNumber(relative_line_number)
    let cursor_position = getpos('.')

    exec a:relative_line_number . 'd'
    call setpos(".", cursor_position)
    normal P
    call setpos(".", cursor_position)
  endfunction

  " Line copy without move the cursor
  nnoremap <Leader>ck :-t.<left><left>
  nnoremap <Leader>cj :+t.<left><left>

  " Macro
  nnoremap Q q
  nnoremap M @q
  vnoremap M :norm @q<CR>

  " Select blocks after indenting
  xnoremap < <gv
  xnoremap > >gv|

  " Toggle fold
  nnoremap <return> za

  " Focus the current fold by closing all others
  nnoremap <leader>z zMl

  " Display diff from last save
  command! DiffOrig vert new | setlocal bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

  " Replace tabs to specs of the current file
  command! Retab :set expandtab | retab

  " Toggle Syntax on markdown files
  nnoremap <Leader>ts :call ToggleMarkdownSyntax()<cr>

  function! ToggleMarkdownSyntax()
    if &syntax == 'markdown' || &syntax == 'liquid'
      exe "set syntax=text"
    elseif &syntax == 'text'
      exe "set syntax=markdown"
    else
      echo 'Not supported'
    end
  endfunction

" -----------------------------------------------------------------------------
" Git
" -----------------------------------------------------------------------------
  nnoremap [Git]s :Gstatus<CR>
  nnoremap [Git]o :call OpenCurrentFileOnGithub()<cr>
  nnoremap [Git]af :Git add %:p<CR><CR>
  nnoremap [Git]ac :call VimuxRunCommand('git add . && git commit')<CR>
  " nnoremap [Git]ac :call VimuxRunCommand('git diff')<CR>
  nnoremap gg :1<CR>

  function! OpenCurrentFileOnGithub()
    let branch_url = system('git remote get-url --all origin | grep github | head -1')
    let branch_path = substitute(split(branch_url, ':')[1], '.git', '', 'g')

    let repo_url = "https://github.com/" .  substitute(branch_path, '\n\+$', '', '') . "/blob/master/" . expand('%') . '\#L' . line('.')
    exec "! open " . repo_url
  endfunction


" -----------------------------------------------------------------------------
" Windows
" -----------------------------------------------------------------------------
  " Split verticaly
  nnoremap <silent> [Windows]v :<C-u>split<CR>

  " Split horizontaly
  nnoremap <silent> [Windows]g :<C-u>vsplit<CR>

  " Close window
  nnoremap <silent> [Windows]c :close<CR>

  " Close all but the current
  nnoremap <silent> [Windows]co :<C-u>only<CR>

  " Back to previoius buffer
  nnoremap <silent> [Windows]b :b#<CR>

  " Rotate buffers
  nnoremap <silent> [Windows]r <C-w>x

  " Detache the current pane to a new full window
  nnoremap <silent> [Windows]n <C-w>T | :tablast

  " Swap panes position
  nnoremap <silent> [Windows]s <C-w>R

  " Zoom buffer
  nnoremap [Windows]z :Goyo<CR>

  " Resize
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize +10<CR>
  nnoremap <Right> :vertical resize -10<CR>
  
" -----------------------------------------------------------------------------
" Registers
" -----------------------------------------------------------------------------
" <Leader>" or @ on normal mode to show registers
  let g:peekaboo_prefix='<leader>'

" -----------------------------------------------------------------------------
" Foldings
" -----------------------------------------------------------------------------
  " Fold the entire file by indentation level
  nnoremap <silent> <leader>1 :let &l:foldlevel = 0<cr>
  nnoremap <silent> <leader>2 :let &l:foldlevel = 1<cr>
  nnoremap <silent> <leader>3 :let &l:foldlevel = 2<cr>
  nnoremap <silent> <leader>4 :let &l:foldlevel = 3<cr>
  nnoremap <silent> <leader>5 :let &l:foldlevel = 4<cr>
  nnoremap <silent> <leader>6 :let &l:foldlevel = 5<cr>
  nnoremap <silent> <leader>7 :let &l:foldlevel = 6<cr>
  nnoremap <silent> <leader>8 :let &l:foldlevel = 7<cr>
  nnoremap <silent> <leader>9 :let &l:foldlevel = 8<cr>
  nnoremap <silent> <leader>0 :let &l:foldlevel = 20<cr>
  " FIXME: For somereason, cant fold php functions like this (the content of
  " return mess something)
  "
    " public function isUserOrderWebsite(): bool {
    "     return $this->orderSource === 'ui-website' && $this->origin === self::ORDER_ORIGIN_USERORDER;
    " }

" -----------------------------------------------------------------------------
" Tabs
" -----------------------------------------------------------------------------
  " Move to left/right
  nnoremap <silent> [Tabs]H :tabmove -1<cr>
  nnoremap <silent> [Tabs]L :tabmove +1<cr>

  nnoremap <silent> [Tabs]n :tabmove +1<cr>

  nnoremap <silent> [Tabs]t :tabnew<CR>
  nnoremap <silent> [Tabs]l :tabnext<CR>
  nnoremap <silent> [Tabs]h :tabprev<CR>

  nnoremap <silent> [Tabs]m <C-W><S-T>
" -----------------------------------------------------------------------------
" Files
" -----------------------------------------------------------------------------
  " Duplicate current file
  nnoremap [Files]du :saveas <C-r>=expand('%')<cr><left><left><left>

  " Run rubocop
  nnoremap <silent> [Files]ru :! bundle exec rubocop -a <C-r>=expand('%')<cr>  >/dev/null<cr> <cr>

  " reload the file
  nnoremap [Files]ch :checktime<cr>

  " Delete current file
  nnoremap [Files]de :!rm %

  " Move/Rename current file: with coc it will trigger refactors!
  " nnoremap [Files]m :!mv <C-r>=expand('%')<cr> <C-r>=expand('%')<cr>
  nnoremap [Files]m :CocCommand workspace.renameCurrentFile<cr>

  " Copy Relative path
  nnoremap <silent> [Files]y :let @+=join([expand("%"), line('.')], ':')<CR>:echo 'Relative path copied to clipboard.'<CR>

  " Copy Absolute path
  nnoremap <silent> [Files]Y :let @+=expand("%:p")<CR>:echo 'Absolute pat copied to clipboard.'<CR>

  " Sidebars
  nnoremap <silent> [Files]f :NERDTreeFind<CR>
  nnoremap <silent> [Files]e :NERDTreeToggle<CR>

  " Find all
  nnoremap [Files]g :F <c-r>=expand("<cword>")<cr> **/*.* -S <left><left><left><left><left><left><left>
  nnoremap [Files]r :Far <c-r>=expand("<cword>")<cr> **/*.* -S<left><left><left><left><left><left><left>

" -----------------------------------------------------------------------------
" FuzzyFinder
" -----------------------------------------------------------------------------
  nnoremap <silent> [FuzzyFinder]f :Files<cr>
  nnoremap <silent> [FuzzyFinder]mo :Files <cr> app/models/
  nnoremap <silent> [FuzzyFinder]rs :Files <cr> spec/_spec.rb<left><left><left><left><left><left><left><left>
  nnoremap <silent> [FuzzyFinder]c :Files <cr> app/controllers/
  nnoremap <silent> [FuzzyFinder]g :Find<cr>
  nnoremap <silent> [FuzzyFinder]t :Tags <cr>
  nnoremap <silent> [FuzzyFinder]T :BTags <cr>
  " TODO use G for find using gitignore
  nnoremap <silent> [FuzzyFinder]G :FindCode <cr>
  nnoremap <silent> [FuzzyFinder]Gt :FindTest <cr>
  nnoremap <silent> [FuzzyFinder]Gc :BCommits <cr>

  " nnoremap [FuzzyFinder]/ <Plug>(AerojumpBolt)
  nnoremap <silent> [FuzzyFinder]/ :BLines <cr>
  nnoremap <silent> [FuzzyFinder]me :BLines <cr> def\<space>

" -----------------------------------------------------------------------------
" Dictionary and documentations
" -----------------------------------------------------------------------------
  " Open the macOS dictionary on current word
  " nnoremap <Leader>? :!open dict://<cword><CR><CR>
  nnoremap <Leader>? :!open dict://<q-args>

  :nnoremap <silent> <leader>k <Plug>DashSearch

  " Use K for show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

" -----------------------------------------------------------------------------
" UltiSnips
" -----------------------------------------------------------------------------
  " Always open at ~/.config/nvim/UltiSnips  
  nnoremap <leader>es :UltiSnipsEdit<cr>

" -----------------------------------------------------------------------------
" COC and Gotos
" -----------------------------------------------------------------------------
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  nnoremap <silent> [FuzzyFinder]me :CocList outline<cr>

" TODO: delete this gd, it's crap and make coc become crazy dont know why 
" " map gd to coc definition WITH callback para ctags
" function! s:GoToDefinition()
"   if CocAction('jumpDefinition') " CocActionAsync don't return true!!! doesnt work
"     return v:true
"   endif

"   let ret = execute("silent! normal \<C-]>")
"   if ret =~ "Error" || ret =~ "错误"
"     call searchdecl(expand('<cword>'))
"   endif
" endfunction

" nmap <silent> gd :call <SID>GoToDefinition()<CR>


""BACKUP"
  " Mapping coc to use c-j and c-k, like vim to go though the list
  " CAREFUL: disable c-l on emmet for this
  " inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  " inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

  """""" DOES NOT WORKD .... BEGIN
  " BUG WITH VIM ENDSWISE
  " mappign enter to select/confirm the snippet
  " if exists('*complete_info')
  "   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  " else
  "   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " endif

  "" jump with tab between autocompletion -> NONE WORKED
  "" TRY HARD!
  "if exists('*complete_info')
  "  inoremap <expr> <tab> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<TAB>"
  "else
  "  imap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"
  "endif
  ""TRY HARD2 from coc 
  "" use <tab> for trigger completion and navigate to the next complete item
  "function! s:check_back_space() abort
  "  let col = col('.') - 1
  "  return !col || getline('.')[col - 1]  =~ '\s'
  "endfunction

  "inoremap <silent><expr> <Tab>
  "      \ pumvisible() ? "\<C-n>" :
  "      \ <SID>check_back_space() ? "\<Tab>" :
  "      \ coc#refresh()
  """""" DOES NOT WORKD .... END

" -----------------------------------------------------------------------------
" Tabularize
" -----------------------------------------------------------------------------
  nnoremap <Leader>t, :Tabularize /,\zs <CR>
  vnoremap <Leader>t, :Tabularize /,\zs <CR>
  nnoremap <Leader>t= :Tabularize /=\zs <CR>
  vnoremap <Leader>t= :Tabularize /=\zs <CR>
  nnoremap <Leader>t: :Tabularize /:\zs <CR>
  vnoremap <Leader>t: :Tabularize /:\zs <CR>
  nnoremap <Leader>tt :Tabularize /
  vnoremap <Leader>tt :Tabularize /

" -----------------------------------------------------------------------------
" Terminal/Tmux pane integration
" -----------------------------------------------------------------------------
  nnoremap [Terminal]b :below new \| resize 10 \| terminal bundle install<CR>
  nnoremap [Terminal]c :call VimuxRunCommand(join(['clear ;', 'bin/cop', expand('%')], ' '))<CR>
  nnoremap [Terminal]e :call VimuxRunCommand('exit')<CR>
  " nnoremap [Terminal]s :below new \| resize 10 \| bundle exec rspec . expand('%') . ' --fail-fast'<CR>
  " nnoremap [Terminal]pm :below new \| resize 10 \| terminal topcli pr list<CR>
  " nnoremap [Terminal]pt :below new \| resize 10 \| terminal topcli pr list team<CR>
  " nnoremap [Terminal]s :below new \| resize 10 \| terminal bin/setup
  nnoremap [Terminal]t :call RunTestsOnLeftPane(expand('%:p')) <CR> :echo g:VimuxLastCommand<CR>
  nnoremap [Terminal]T :call RunTestsOnLeftPane(join([expand('%:p'), line('.')], ':'))<CR> :echo g:VimuxLastCommand<CR>

  " Prompt for a command to run
  nnoremap [Terminal]! :VimuxPromptCommand<CR>

  " Run the last shell command
  nnoremap <silent><leader>l :!!<CR>

  " Run last command executed by VimuxRunCommand
  nnoremap [Terminal]l :VimuxRunLastCommand<CR> :echo g:VimuxLastCommand<CR>

  " Close vim tmux runner opened by VimuxRunCommand
  nnoremap [Terminal]q :VimuxCloseRunner<CR>

  " If text is selected, save it in the v buffer and send that buffer it to tmux
  vnoremap <leader>! "vy :call VimuxSlime()<CR>

  " Select current paragraph and send it to tmux
  nnoremap <leader>! vip<leader>ts<CR>

  " Use normal mode when a buffer is opened. Use i to return. E.g: after ;g to find something
  tnoremap jj <C-\><C-n>

  function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
  endfunction

  function! RunTestsOnLeftPane(file_name_full_path)
    if( match(a:file_name_full_path, 'tests/.*Test.php') != -1)
      let relative_path = fnamemodify(a:file_name_full_path, ":~:.")
      VimuxRunCommand("d.c exec hq-central php -d xdebug.profiler_enable=0 vendor/be/bin/phpunit --configuration=tests/phpunit.xml --stop-on-failure " . relative_path)
    elseif( match(a:file_name_full_path, '**.test.ts') != -1)
      let relative_path = fnamemodify(a:file_name_full_path, ":~:.")
      VimuxRunCommand("NODE_ENV=dev ./node_modules/mocha/bin/mocha --require ts-node/register --full-trace --bail " . relative_path)
    elseif(match(a:file_name_full_path, '_spec.rb') != -1)
      VimuxRunCommand("clear; bundle exec rspec " . a:file_name_full_path . " --fail-fast -fd")
    elseif(match(a:file_name_full_path, '.feature') != -1)
      VimuxRunCommand("clear; bin/spring cucumber " . a:file_name_full_path . " --fail-fast --profile")
    elseif(match(a:file_name_full_path, 'test/.*_test.exs') != -1)
      VimuxRunCommand("clear; mix test " . a:file_name_full_path)
    elseif(match(a:file_name_full_path, 'test/.*_test.rb') != -1)
      VimuxRunCommand("clear; be rake test TEST=" . a:file_name_full_path)
    elseif(match(a:file_name_full_path, 'tests/flows/.*_process.rb') != -1)
      VimuxRunCommand("clear; bundle exec flows test " . a:file_name_full_path)
    else
      echo "doesnt worked"
    endif
  endfunction

" -----------------------------------------------------------------------------
" Javascript
" -----------------------------------------------------------------------------
  function! JSTextObjectFunction()
      normal! ]}%
      execute "normal ?function\<CR>"
      normal! vf{%
  endfunction
  " vnoremap af :<C-U>silent! :call JSTextObjectFunction()<CR>

  nnoremap <leader>jsd <Plug>(jsdoc)

  function! JumpToAlternateWithTestPrefix(prefix) 
    let filename = expand('%')
    let extension = expand('%:e')
    let alternate

    echo '@@@ ' . filename . extension

    " if(match(filename, '.*test.' . extension))
    "   test_prefix_size = strlen('tests/' . prefix .'/')
    "   tail_size = -1 * strlen('test.' . extension) - 1
    "   alternate = 'src/' . filename[test_prefix_size:tail_size] . extension
    " elseif(filename[0:2] ==# 'src')
    "   src_prefix_size = strlen('src/')
    "   tail_size = -1 * strlen(extension) - 1
    "   alternate = 'tests/' . filename[src_prefix_size:tail_size] . 'tests.' . extension
    " endif 

    " if strlen(alternate) == 0
    "   echohl WarningMsg | echo "Alternate file not found!" | echohl None 
    " elseif filereadable(alternate)
    "   exec ':e ' . alternate
    " else
    "   " TODO: option to create te file, creating inclusive the filepath
   " endif
      
  endfunction

  " command A already solved with vim projections!
  " command A call JumpToAlternateWithTestPrefix('unit')
  " command! Af call JumpToAlternateWithTestPrefix('functional')

" -----------------------------------------------------------------------------
" Elixir
" -----------------------------------------------------------------------------
  iabbrev pp \|>

" -----------------------------------------------------------------------------
" Ruby
" -----------------------------------------------------------------------------
  nnoremap [Ruby]ap  :RAddParameter<cr>
  nnoremap [Ruby]ti  :RConvertPostConditional<cr>
  nnoremap [Ruby]ele :RExtractLet<cr>
  vnoremap [Ruby]eco :RExtractConstant<cr>
  vnoremap [Ruby]em  :RExtractMethod<cr>

  vnoremap <silent> [Ruby]p :<C-u>RubyEvalPrint<CR>
  vnoremap <silent> [Ruby]i :<C-u>RubyEvalInsert<CR>

  nnoremap <silent> [Ruby]p :<C-u>RubyEvalPrint<CR>
  nnoremap <silent> [Ruby]i :<C-u>RubyEvalInsert<CR>


" -----------------------------------------------------------------------------
" Json and text general helpers - focused on javascript
" -----------------------------------------------------------------------------
xnoremap <Leader>j :s/\([^:]\+\):\s*\(.*\)[,]/\1: \2,/g<LEFT><LEFT><LEFT><LEFT><LEFT>
xnoremap <Leader>= :s/\([^=]\+\)=\s*\(.*\)[;]/\1= \2;/g<LEFT><LEFT><LEFT><LEFT><LEFT>
"s/\([^:]\+\)\s=\s*\(.*\)/(\1)(\2)
" xnoremap <Leader>j :s/\([a-zA-Z0-9_]\+\)\s*:\(.*\)//g<LEFT><LEFT>
xnoremap <Leader>jj :s/\([a-zA-Z0-9_]\+\)\s*:\(.*\)/"\1":\2/g<CR>
xnoremap <Leader>jo :s/["']\([a-zA-Z0-9_]\+\)["']\s*:\(.*\)/\1:\2/g<CR>
" TODO make a script to apply multiple operations at once 
" Map to select everything before a symbol --> https://stackoverflow.com/questions/26853667/using-variable-in-vim-key-mappings

" -----------------------------------------------------------------------------
" Formating
" -----------------------------------------------------------------------------
nnoremap <leader>fj :%!python -m json.tool<cr>
xnoremap <leader>fj :!python -m json.tool<cr>
" format the select text. Uses plugins depending on file type
vmap <leader>f <Plug>(coc-format-selected)
" format all file. Uses plugins depending on file type
nnoremap <leader>f <Plug>(coc-format)

" Remove lines with a specify patter
" TODO make this work with fzf

" nnoremap <leader>rp :g//d<left><left>

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <plug>(coc-codeaction-selected)

xmap <leader>r <plug>(coc-refactor)
nmap <leader>r <plug>(coc-refactor)

" TODO fixme bellow not working try copy paste command
nnoremap <leader>md :!grip @+=expand("%:p") 6420 && xdg-open http://localhost:6420/<CR> 


" TODO: use this for rename instead of just move. Also fix the move, is really
" " shit right now
" CocCommand workspace.renameCurrentFile
" Check https://github.com/Microsoft/TypeScript/blob/master/lib/protocol.d.ts#L5
"  to see things provided by tsserver. coc seens to be using it. Just search
"  on coc-tsserver some of the commands provided to see.
"
" GocAction('gethover') doesnt work to copy coc-eslint errors, maybe I need to
" have selected the text but this is a problem...
