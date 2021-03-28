" airline settings
let g:airline#extensions#battery#enabled = 1           " battery integration (default = 0)
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like TABS to denote tabs
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like BUFFERS to denote buffers
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 1    " show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 1      " show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 1       " buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#tab_nr_type = 1       " tab number type (splits or tab index)
let g:airline#extensions#tabline#show_tab_nr = 1       " tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " the weird orange arrow on the tabline
