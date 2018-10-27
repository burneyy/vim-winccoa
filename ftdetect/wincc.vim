au BufNewFile,BufRead *.ctl set syntax=ctl | set filetype=ctl
au BufNewFile,BufRead *.pnl,*.pnl.bak set syntax=pnl | set filetype=pnl

" Convert to more user friendly view
"au BufReadPost,BufWritePost *.pnl,*.pnl.bak call ToCtl()
"au BufWritePre *.pnl,*.pnl.bak call ToPnl()
