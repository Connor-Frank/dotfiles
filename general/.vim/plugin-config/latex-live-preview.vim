let uname = substitute(system('uname'), '\n', '', '')
if uname == 'Darwin'
  let g:livepreview_previewer = 'open -a Preview'
endif
