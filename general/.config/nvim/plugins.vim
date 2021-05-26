"autoinstall vim plug
"check for uninstalled plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"auto install plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

call plug#begin('~/.config/nvim/pack')

"statusline/bufferline
Plug 'itchyny/lightline.vim'
Plug 'ojroques/vim-scrollstatus'

"icons
Plug 'ryanoasis/vim-devicons'

"fuzzy search + files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }

"minimap // enable when supported in openGL neovide
""Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

" auto commenter
Plug 'preservim/nerdcommenter'

"git
Plug 'tpope/vim-fugitive', { 'on': [] }
Plug 'airblade/vim-gitgutter'

"unix commands
Plug 'tpope/vim-eunuch'

"start dash + give a tip
Plug 'glepnir/dashboard-nvim'

"distraction free/zen mode
Plug 'kdav5758/TrueZen.nvim'
Plug 'junegunn/goyo.vim', {'on': 'Goyo' }
Plug 'junegunn/limelight.vim', {'on': 'Goyo' }

"syntax/themes (treesitter replacing polygot)
Plug 'flazz/vim-colorschemes'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
""Plug 'drewtempelmeyer/palenight.vim'
""Plug 'Brettm12345/moonlight.vim'
""Plug 'GustavoPrietoP/doom-one.vim'
""Plug 'arzg/vim-colors-xcode'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

"markdown writing
Plug 'kana/vim-textobj-user', {'for': 'markdown'}
Plug 'preservim/vim-textobj-quote', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"kotlin support
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}

"writing plugins
Plug 'preservim/vim-litecorrect'

"lines on indents + auto pairs+ multiple cursors
Plug 'Yggdroot/indentLine'

"linting + lsp
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'

"rich presence
""Plug 'andweeb/presence.nvim'

"easymotions
Plug 'phaazon/hop.nvim'

"cool animations
"Plug 'camspiers/animate.vim'
"Plug 'camspiers/lens.vim'
call plug#end()
