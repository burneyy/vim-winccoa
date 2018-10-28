runtime! ftplugin/cpp.vim

" Perform automatic conversions? Default: No
if !exists("g:winccoa_pnl_auto_swapquotes")
    let g:winccoa_pnl_auto_swapquotes=0
endif

command! SwapQuotes call SwapQuotes()
function SwapQuotes(...)
    if a:0 == 0 || a:1 == "auto" && g:winccoa_pnl_auto_swapquotes == 1
        let l:save = winsaveview()
        let l:temppattern = "$@%&€;"
        " 1. Replace all escaped quotes with temporary pattern
        %s/\\"/l:temppattern/ge
        " 2. Replace all normal quotes with escaped quotes
        %s/"/\\"/ge
        " 3. Replace all temporary patterns with normal quotes
        %s/l:temppattern/"/ge
        call winrestview(l:save)
    endif
endfunction
