runtime! ftplugin/cpp.vim

" Perform automatic conversions? Default: No
if !exists("g:winccoa_pnl_auto_conversion")
    let g:winccoa_pnl_auto_conversion=0
endif


" Between '"main()' and '" 0' replace all escaped quotes with normal quotes
command! ToCtl call ToCtl()
function ToCtl(...)
    if a:0 == 0 || a:1 == "auto" && g:winccoa_pnl_auto_conversion == 1
        let l:save = winsaveview()
        g/"main(.*)$/+1,/" 0$/-1s/\\"/"/g
        call winrestview(l:save)
    endif
endfunction

" Reverse replacement
command! ToPnl call ToPnl()
function ToPnl(...)
    if a:0 == 0 || a:1 == "auto" && g:winccoa_pnl_auto_conversion == 1
        " First replace all empty strings ("")
        " (are not covered by the next step for some reason...)
        let l:save = winsaveview()
        g/"main(.*)$/+1,/" 0$/-1s/[^\\]\zs""\ze/\\"\\"/g
        " Then replace single quotes (but not \" !)
        g/"main(.*)$/+1,/" 0$/-1s/[^\\]\zs"\ze/\\"/g
        call winrestview(l:save)
    endif
endfunction
