runtime! ftplugin/cpp.vim

" Perform automatic conversions? Default: Yes
if !exists("g:winccoa_pnl_auto_swapquotes")
    let g:winccoa_pnl_auto_swapquotes=1
endif

command! SwapQuotes call SwapQuotes()
function! SwapQuotes(...)
    if a:0 == 0 || a:1 == "auto" && g:winccoa_pnl_auto_swapquotes == 1
        let l:save = winsaveview()
        %s/\v(\\"|")/\={'\"':'"','"':'\"'}[submatch(0)]/ge
        call winrestview(l:save)
    endif
endfunction
