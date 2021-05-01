set nocompatible

"__PLUGINS__"

source $HOME/.config/nvim/plugins.vim

"__COLORS__"

"set true colors for term + vim
if has('termguicolors')
  set termguicolors
endif
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

set background=dark
colorscheme nord

"fix bg
"hi NORMAL guibg=#282c34

"enable syntax
syntax enable
"set 256 colors
set t_Co=256

"Neovide + gui
set guifont=Hack\ Nerd\ Font:h15
let g:neovide_cursor_antialiasing=v:true
"let g:neovide_fullscreen=v:true
let g:neovide_refresh_rate=60
let g:neovide_keyboard_layout="qwerty"
let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_animation_length=0.13
let g:neovide_cursor_trail_length=0.8

"__VIM_SETTINGS__"

" general options from boomer vim
source $HOME/.vim/options.vim

"numrow transparent, vert split line transparent.
highlight clear SignColumn
hi VertSplit ctermfg=1 ctermbg=NONE cterm=NONE
set fillchars+=vert:┊

"highlight current number
set number
set cursorline
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight clear CursorLine

augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END

"remove empty line symbols
let &fcs='eob: '

set noshowmode showcmd
set laststatus=2
set showtabline=2

"__VIM_BINDINGS__"

" generic keybindings
source $HOME/.vim/keymaps.vim

"shortcuts to open config
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>ez :vsp ~/.config/zsh/.zshrc<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

"easymotion/hop"
nnoremap <leader>w :HopWord<CR>
nnoremap <leader>l :HopLine<CR>

"fuzzy stuff
nnoremap <leader>o :History<CR>
nnoremap <leader>p :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <leader>f :BLines<CR>

"F12 for cool mode"
nnoremap <leader>z :TZAtaraxis<CR>
"
"save session
nnoremap <leader>s :mksession<CR>

"f5 to run current filetype
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java -cp %:p:h %:t:r"
  elseif &filetype == 'sh'
    exec "!time bash %"
  elseif &filetype == 'python'
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
  endif
endfunc

"__LIGHTLINE, FZF, TERMINAL__"

"lightline setup
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'filetype', 'modified', 'gitbranch', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ],
        \   'right': [ ['fileformat', 'percent','lineinfo'] ],
      \ },
      \ 'component_function': {
        \    'filetype': 'MyFiletype',
        \    'fileformat': 'MyFileformat',
        \    'wordcount': 'WordCount',
        \    'gitbranch': 'FugitiveHead',
        \    'readonly': 'LightlineReadonly',
        \ },
        \ 'component_expand': {
          \   'linter_checking': 'lightline#ale#checking',
          \   'linter_infos': 'lightline#ale#infos',
          \   'linter_warnings': 'lightline#ale#warnings',
          \   'linter_errors': 'lightline#ale#errors',
          \   'linter_ok': 'lightline#ale#ok',
          \ },
          \ 'component_type': {
            \   'linter_checking': 'right',
            \   'linter_infos': 'right',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'right',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

"add devicon to lightline
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"create function to get read only
function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

"create function to get workdcount
function! WordCount()
  let currentmode = mode()
  if !exists("g:lastmode_wc")
    let g:lastmode_wc = currentmode
  endif
  " if we modify file, open a new buffer, be in visual ever, or switch modes
  " since last run, we recompute.
  if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' || currentmode != g:lastmode_wc
    let g:lastmode_wc = currentmode
    let l:old_position = getpos('.')
    let l:old_status = v:statusmsg
    execute "silent normal g\<c-g>"
    if v:statusmsg == "--No lines in buffer--"
      let b:wordcount = 0
    else
      let s:split_wc = split(v:statusmsg)
      if index(s:split_wc, "Selected") < 0
        let b:wordcount = str2nr(s:split_wc[11])
      else
        let b:wordcount = str2nr(s:split_wc[5])
      endif
      let v:statusmsg = l:old_status
    endif
    call setpos('.', l:old_position)
    return b:wordcount
  else
    return b:wordcount
  endif
endfunction


let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"nord
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:#bbc2cf,bg:#414C60,hl:#baacff,fg+:#bbc2cf,bg+:#414C60,hl+:#5B6268 --color=info:#414C60,prompt:#414C60,pointer:#c678dd,marker:#414C60,spinner:#414C60,header:-1 --layout=reverse  --margin=1,4'

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

""function to create a floating fzf window
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(30)
  let width = float2nr(135)
  let horizontal = float2nr((&columns - width) / 2)
  ""let vertical = 1
  let vertical = float2nr((&lines - height) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)

  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)

  " Styling
  hi FloatWinBorder guifg=#bbc2cf
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatWinBorder')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')

  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif

  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

"map FloatermNew to new terminal
command FloatermNew call FloatTerm()

"__PLUGIN_SETTINGS__"

"lightline ale
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

"disable ale on start
""let g:ale_enabled = 0

let g:ale_sign_error = '×'
let g:ale_sign_warning = '»'

let g:ale_linters = {
      \   'mail': ['proselint'],
      \   'markdown': ['proselint', 'languagetool'],
      \   'text': ['proselint', 'languagetool'],
      \   'python': ['pyls', 'autoimport', 'flake8', 'yapf'],
      \   }
let g:ale_fixers = {
      \   '*':          ['remove_trailing_lines', 'trim_whitespace'],
      \}

let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

"litecorrect
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType textile call litecorrect#init()
augroup END

"make cursor line -> block
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"anti-delay for above
set ttimeout
set ttimeoutlen=1
set ttyfast

"make statusline transparent (kindof working)
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort

  " transparent background in statusbar
  let l:palette = lightline#palette()
  let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let l:palette.insert.middle = l:palette.normal.middle
  let l:palette.visual.middle = l:palette.normal.middle
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle
  call lightline#colorscheme()
endfunction

"indentline
let g:indentLine_char = '|'
let g:indentLine_fileTypeExclude = ['dashboard'] "stop indentlines on dashboard

"NERDTree
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeHighlightCursorline = 0
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable = '»'
let g:NERDTreeDirArrowCollapsible = '«'
let NERDTreeShowHidden=1

"dashboard
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_header =<< trim END
███████ ██████   █████  ███    ██ ██   ██ ██    ██ ██ ███    ███ 
██      ██   ██ ██   ██ ████   ██ ██  ██  ██    ██ ██ ████  ████ 
█████   ██████  ███████ ██ ██  ██ █████   ██    ██ ██ ██ ████ ██ 
██      ██   ██ ██   ██ ██  ██ ██ ██  ██   ██  ██  ██ ██  ██  ██ 
██      ██   ██ ██   ██ ██   ████ ██   ██   ████   ██ ██      ██ 
END

"minimap
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

"limelight
let g:limelight_paragraph_span = 0

"vim markdown
let g:vim_markdown_folding_disabled = 1
"quote stuff (curly instead of normal "", qc to autocorrect)
filetype plugin on       " may already be in your .vimrc
nnoremap <silent> qr <Plug>ReplaceWithCurly
"spell check for only markdown
autocmd FileType markdown setlocal spell
"set to conceal formatting by default to not clutter
""set conceallevel=2

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

"lazy load vim-fuigitive
command! Gstatus call LazyLoadFugitive('Gstatus')
command! Gdiff call LazyLoadFugitive('Gdiff')
command! Glog call LazyLoadFugitive('Glog')
command! Gblame call LazyLoadFugitive('Gblame')
function! LazyLoadFugitive(cmd)
  call plug#load('vim-fugitive')
  call fugitive#detect(expand('%:p'))
  exe a:cmd
endfunction

"limelight
let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"__LUA__"

"zen-mode settings
lua << EOF
-- setup for TrueZen.nvim
require("true-zen").setup({
true_false_commands = false,
cursor_by_mode = false,
before_minimalist_mode_shown = false,
before_minimalist_mode_hidden = false,
after_minimalist_mode_shown = false,
after_minimalist_mode_hidden = false,
bottom = {
  hidden_laststatus = 0,
  hidden_ruler = false,
  hidden_showmode = false,
  hidden_showcmd = false,
  hidden_cmdheight = 1,

  shown_laststatus = 2,
  shown_ruler = true,
  shown_showmode = false,
  shown_showcmd = false,
  shown_cmdheight = 1
  },
  top = {
    hidden_showtabline = 0,

    shown_showtabline = 2
    },
    left = {
      hidden_number = false,
      hidden_relativenumber = false,
      hidden_signcolumn = "no",

      shown_number = true,
      shown_relativenumber = false,
      shown_signcolumn = "no"
      },
      ataraxis = {
        just_do_it_for_me = false,
        left_padding = 40,
        right_padding = 40,
        top_padding = 0,
        bottom_padding = 0,
        custome_bg = "#282c34"
        },
        focus = {
          margin_of_error = 5
          },
          integrations = {
            integration_galaxyline = false,
            integration_vim_airline = false,
            integration_vim_powerline = false,
            integration_tmux = false,
            integration_express_line = false,
            integration_gitgutter = false,
            integration_vim_signify = false,
            integration_limelight = false
            }
            })
EOF
