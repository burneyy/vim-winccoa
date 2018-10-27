au BufNewFile,BufRead *.ctl set syntax=ctl | set filetype=ctl
au BufNewFile,BufRead *.pnl,*.pnl.bak set syntax=pnl | set filetype=pnl

" Convert .pnl files automatically to ctl-like format during editing
au BufReadPost,BufWritePost *.pnl,*.pnl.bak call ToCtl("auto")
au BufWritePre *.pnl,*.pnl.bak call ToPnl("auto")
