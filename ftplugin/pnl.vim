runtime! ftplugin/cpp.vim

" Perform automatic conversions? Default: No
if !exists("g:winccoa_pnl_auto_conversion")
    let g:winccoa_pnl_auto_conversion=0
endif

" Store current format in variable
let b:current_format="pnl"

" Between '"main()' and '" 0' replace all escaped quotes with normal quotes
function ToCtl(...)
    if a:0 == 0 || a:1 == "auto" && g:winccoa_pnl_auto_conversion == 1
        if b:current_format == "pnl"
            g/"main()$/+1,/^" 0$/-1s/\\"/"/g
            let b:current_format="ctl"
        else
            echom "Already in .ctl format!"
        endif
    endif
endfunction

" Reverse replacement
function ToPnl(...)
    if a:0 == 0 || a:1 == "auto" && g:winccoa_pnl_auto_conversion == 1
        if b:current_format == "ctl"
            g/"main()$/+1,/^" 0$/-1s/"/\\"/g
            let b:current_format="pnl"
        else
            echom "Already in .pnl format!"
        endif
    endif
endfunction
