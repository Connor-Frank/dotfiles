let mapleader = "\<Space>"

" clear search
noremap <leader>n :noh<CR>

" code formatting
noremap <leader>lf :FormatCode<CR>

" markdown preview
nmap <leader>m <Plug>MarkdownPreview

" latex preview
nmap <leader>p :LLPStartPreview<CR>

" open file explorer (ranger) with <leader>f by default

" terminal
nmap <leader>o :term<CR>

" space-e to toggle tagbar
nmap <leader>e :TagbarToggle<CR>

" leader + c to comment/uncomment
nmap <leader>c <Plug>NERDCommenterToggle
vmap <leader>c <Plug>NERDCommenterToggle<CR>gv

" -------------------------------------------------- 

" tab configuration

" space-t for new tab
nmap <leader>t :tablast <bar> :tabnew<CR>

" space-1,9 to navigate to other tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>

" move tabs left/right using space-arrow keys
noremap <leader><Left>  :-tabmove<cr>
noremap <leader><Right> :+tabmove<cr>

" --------------------------------------------------

" splits

" use space + j/k/l/h to move between splits, like with cursor
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>

" --------------------------------------------------

" buffer configuration
" space-q to close buffer
nmap <leader>q :bd<CR>

" show buffers
nnoremap <silent> <leader>bb :buffers<CR>

" delete hidden buffers
function DeleteHiddenBuffers()
	let tpbl=[]
	call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
	for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
		silent execute 'bwipeout' buf
	endfor
endfunction
" delete empty buffers
function! DeleteEmptyBuffers()
	let [i, n; empty] = [1, bufnr('$')]
	while i <= n
		if bufexists(i) && bufname(i) == ''
			call add(empty, i)
		endif
		let i += 1
	endwhile
	if len(empty) > 0
		exe 'bdelete' join(empty)
	endif
endfunction

" space-x to delete empty and hidden buffers
nnoremap <leader>bx :call DeleteEmptyBuffers() <bar> :call DeleteHiddenBuffers()<CR>
