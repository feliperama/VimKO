call plug#begin()

" -----------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------
  " Insert and delete brakets, parens, quotes.
  Plug 'jiangmiao/auto-pairs'
    " bugs try https://github.com/jiangmiao/auto-pairs/pull/291

  " granular project configuration using projections
  Plug 'tpope/vim-projectionist'
  source $HOME/.config/nvim/config/plugins/projectionist.vimrc

  " Fuzzy finder for lines in the current file
  Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

  " Slack on VIM
  Plug 'yaasita/edit-slack.vim'


  " Edit selected code in new buffer
  Plug 'chrisbra/NrrwRgn'

  " Grammar Checker
  Plug 'rhysd/vim-grammarous'

  " Highligh the cursor word
  Plug 't9md/vim-quickhl'

  " Expand region
  Plug 'terryma/vim-expand-region'

  " Tmux tabs integration
  Plug 'christoomey/vim-tmux-navigator'


  " Send commands to other tmux tabs from vim
  Plug 'benmills/vimux'
    let g:VimuxOrientation = "h"
    let g:VimuxHeight = "105"
    let g:VimuxPromptString = "> "

  " Highligh cursor word
  Plug 'itchyny/vim-cursorword'

  " Multiple cursors
  Plug 'terryma/vim-multiple-cursors'

  " Alig code
  Plug 'godlygeek/tabular',{  'on': 'Tabularize'}

  " Comments
  Plug 'tpope/vim-commentary'

  " Find and Replace
  Plug 'brooth/far.vim',{  'on': ['Far',  'Farp',  'F', 'Farr', 'Farf'] }
    let g:far#source = 'rgnvim'
  Plug 'jremmen/vim-ripgrep'

  " Conversion to snake camel and other stuff
  Plug 'tpope/vim-abolish'

  " Allow repeat to work with plugins
  Plug 'tpope/vim-repeat'

  " Visual indentation
  Plug 'Yggdroot/indentLine'
    let g:indentLine_enabled = 0

  " Nice starup
  Plug 'mhinz/vim-startify'

  " Highligh empty space and auto remove it
  Plug 'ntpeters/vim-better-whitespace'
    let g:better_whitespace_enabled=0
    let g:strip_whitespace_on_save=0

  " Better motion
  Plug 'easymotion/vim-easymotion'

  " Bookmarks
  Plug 'MattesGroeger/vim-bookmarks'

  " Nice foldings
  Plug 'tmhedberg/SimpylFold'

  " Navigate and highlight matching words
  " BUG --> sometimes stop to work with big javscript libraries like
  " underscore.js. IF % stops to work it's because of this
  Plug 'andymass/vim-matchup'

  " Open current workd in Dash
  Plug 'rizzatti/dash.vim'

" -----------------------------------------------------------------------------
" Theme
" -----------------------------------------------------------------------------
  Plug 'rakr/vim-one'

" -----------------------------------------------------------------------------
" Fuzzy finder
" -----------------------------------------------------------------------------
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  source $HOME/.config/nvim/config/plugins/fzf.vimrc
  let g:fzf_layout = { 'down': '~40%' }

" -----------------------------------------------------------------------------
" Sidebar
" -----------------------------------------------------------------------------
  Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'Xuyuanp/nerdtree-git-plugin',{  'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  " FIXME: devicons. Note that nerd-fonts was not in the original one 
  " Plug 'ryanoasis/nerd-fonts' --> not sure how to use. People said to use
  " install.sh to install. Not sure if is a plugin or a SO stuff
  " Plug 'ryanoasis/vim-devicons',{ 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  " Need the following command to work commands inside nerdtree buffer:
  autocmd! User nerdtree exe 'source' '$HOME/.config/nvim/config/plugins/nerdtree.vim'

" -----------------------------------------------------------------------------
" Airline
" -----------------------------------------------------------------------------
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_section_a = ''
    let g:airline_section_b = ''
    let g:airline_section_z = '%3p%%/%L'
    let g:airline_section_y = ''
    let g:airline_section_x = ''
    let g:airline#extensions#tagbar#enabled = 0
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" -----------------------------------------------------------------------------
" Autocomplete and Snippets
" -----------------------------------------------------------------------------
  Plug 'SirVer/ultisnips'
    let g:UltiSnipsEditSplit="vertical"
    " let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsExpandTrigger="<none>"
    " let g:UltiSnipsJumpForwardTrigger="<c-n>"
    " let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " BUG: the line below make ultisnips dont look for UltiSnips type on plugins
    " and load just old snipmate (snipmate) directory
    " let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/config/mysnippets"]

  "Coc from master branch 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = [
    \ 'coc-ultisnips',
    \ 'coc-solargraph',
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-yank',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-phpls',
    \ 'coc-emmet',
    \ 'coc-groovy',
    \ 'coc-lists',
    \ 'coc-yaml',
    \ 'coc-go']
    " \ 'coc-java']

    " intelephense: if got lost for some reason, just do > sudo npm i intelephense@latest -g
   "   - more info: https://www.npmjs.com/package/intelephense

    " FIXME replace to use coc-emmet -> dont work well with coc-ttserver
    " because of the filetype javascriptreact
  Plug 'mattn/emmet-vim'
    " this add the coc react jsx filetype to emmet-vim
    autocmd FileType javascriptreact EmmetInstall
    " let g:user_emmet_leader_key=',' "control-y, --> default to trigger things
    " OU para emmet-vim
    "javascript.jsx because of emmet-vim ... NEED to change to use just coc-emmet
    " au BufNewFile,BufRead *.jsx setlocal ft=html ft=javascript ft=javascript.jsx


  Plug 'honza/vim-snippets'
  " Plug 'wellle/tmux-complete.vim'
  " Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  " Plug 'ervandew/supertab'

" -----------------------------------------------------------------------------
" Text Objects
" -----------------------------------------------------------------------------
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'
  Plug 'lucapette/vim-textobj-underscore'
  Plug 'rhysd/vim-textobj-ruby'
  Plug 'kana/vim-textobj-indent'
  
  Plug 'thinca/vim-textobj-function-javascript'
  " --> suggestoin for add typescript, didnt work need tochange the plugin
  " while search('\v(<async>\s+)?(<function>|(\((\k|:\s\k|,|\s)*\)|\k+|\(.*\):\s\k+)\s*\=\>\s*)', 'bcW') != 0
  " DONT work for filetype typescript
  
  Plug 'inside/vim-textobj-jsxattr'
  Plug 'whatyouhide/vim-textobj-erb'
  Plug 'kana/vim-textobj-function'
    " in test: generic, is a callback when the language is not defined. NOT work
    " very well. Typescript doesnt have a good definiton
  " Plug 'haya14busa/vim-textobj-function-syntax'
  

  Plug 'tpope/vim-surround'
    let g:surround_35  = "#{\r}"    " #
    let g:surround_45 = "<% \r %>"  " -
    let g:surround_61 = "<%= \r %>" " =

" -----------------------------------------------------------------------------
" Ctags
" -----------------------------------------------------------------------------
  Plug 'xolox/vim-misc'
  " Plug 'ludovicchabant/vim-gutentags'
  Plug 'majutsushi/tagbar'

" -----------------------------------------------------------------------------
" Registers and Window
" -----------------------------------------------------------------------------
  Plug 'junegunn/vim-peekaboo'
  Plug 'junegunn/goyo.vim'
    let g:goyo_height='95%'
    let g:goyo_width='120'
    autocmd! User GoyoLeave nested exec ':so ~/.config/nvim/init.vim'

" -----------------------------------------------------------------------------
" Git
" -----------------------------------------------------------------------------
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'jreybert/vimagit'

" -----------------------------------------------------------------------------
" Ruby
" -----------------------------------------------------------------------------
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-rails'
  Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
  Plug 'tpope/vim-endwise', { 'for': 'ruby' }
    " let g:endwise_no_mappings = 1
  " Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }
  " Plug 'noprompt/vim-yardoc'
  Plug 'tpope/vim-cucumber'
  Plug 'AndrewRadev/splitjoin.vim'
    " let g:blockle_mapping = '<leader>b'

  Plug 't9md/vim-ruby_eval'
" -----------------------------------------------------------------------------
" Elixir
" -----------------------------------------------------------------------------
  Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'
    let g:mix_format_on_save = 1

" -----------------------------------------------------------------------------
" Go
" -----------------------------------------------------------------------------
  Plug 'fatih/vim-go'

" -----------------------------------------------------------------------------
" Javascript
" -----------------------------------------------------------------------------

  " Doesn't work well with jsx :(
  " Plug 'frazrepo/vim-rainbow'
  "   let g:rainbow_active = 0

  Plug 'Galooshi/vim-import-js'

  " ES2015 code snippets 
  Plug 'epilande/vim-es2015-snippets'

  " React code snippets
  Plug 'epilande/vim-react-snippets' "does not work with filetype javascripreact
  " Plug 'mlaursen/vim-react-snippets'

  Plug 'heavenshell/vim-jsdoc'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'

  " We already have things working well without this 
  " BUT when saves life when breaking lines...
  " Unique anoying thing is when is javascript file, it's highlighting in red
  " everything even the parameters.
  Plug 'chemzqm/vim-jsx-improve'

" IMPORTANT: typescript
" snippets are shared because honza/snippets extends it!! If we use coc it
" wouldn't work


" For javacript and many others, for some reasons need to be after
  Plug 'sheerun/vim-polyglot'
    " need to not conflict with vim-jsx-pretty 
    let g:polyglot_disabled = ['jsx']


" -----------------------------------------------------------------------------
" Python
" -----------------------------------------------------------------------------
  " Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" -----------------------------------------------------------------------------
" Ansible
" -----------------------------------------------------------------------------
  Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }

" -----------------------------------------------------------------------------
" Docker
" -----------------------------------------------------------------------------
  Plug 'ekalinin/Dockerfile.vim'

" -----------------------------------------------------------------------------
" More colorschemes
" -----------------------------------------------------------------------------
  Plug 'tomasr/molokai'
  Plug 'Lokaltog/vim-distinguished'
  Plug 'fugalh/desert.vim'
  Plug 'morhetz/gruvbox'
  Plug 'w0ng/vim-hybrid'
  Plug 'nanotech/jellybeans.vim'

" -----------------------------------------------------------------------------
" Linediff
" -----------------------------------------------------------------------------
  Plug 'AndrewRadev/linediff.vim'

" -----------------------------------------------------------------------------
" PHP and VDEBUG
" -----------------------------------------------------------------------------
  Plug 'vim-vdebug/vdebug'
  " let g:vdebug_options = {'port': '9001'}
  " let g:vdebug_options = {'debug_file': '/home/felipe/vdebug.log'}
    let g:vdebug_options = {
          \ 'port' : 9001,
          \ 'ide_key' : 'VSCODE',
          \ 'path_maps': {
              \ '/www/vhosts/hqm.ssense.com/': '/home/felipe/ssense/workspace/services/hq-central/'
          \ }
          \}

" ALTERNATIVE: vimspector
  " Plug 'puremourning/vimspector'
  "   let g:vimspector_enable_mappings = 'HUMAN'

" -----------------------------------------------------------------------------
" Markdown (.md files) 
" -----------------------------------------------------------------------------
  Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

" -----------------------------------------------------------------------------
" FIXES/Temporary
" -----------------------------------------------------------------------------
  " Plugin to save as sudo. ':sudo tee %' is not working on neovim
  Plug 'lambdalisue/suda.vim'

call plug#end()


