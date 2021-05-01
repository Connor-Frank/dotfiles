" install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/pack')

" themes
Plug 'arcticicestudio/nord-vim'

" lightline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" auto commenter
Plug 'preservim/nerdcommenter'

" tagbar (on the right, shows methods)
Plug 'preservim/tagbar'

" install kite using vimplug
"Plug 'kiteco/vim-plugin' , { 'as': 'kite' }

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" ranger
Plug 'francoiscabrol/ranger.vim'

" pdf viewer
Plug 'makerj/vim-pdf'

" markdown live preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" latex live preview
Plug 'xuhdev/vim-latex-live-preview'

" git gutter
Plug 'airblade/vim-gitgutter'

call plug#end()
