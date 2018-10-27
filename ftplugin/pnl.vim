runtime! ftplugin/cpp.vim

" Store current format in variable
let b:current_format="pnl"

" Between '"main()' and '" 0' replace all escaped quotes with normal quotes
function ToCtl()
    if b:current_format == "pnl"
        g/"main()$/+1,/^" 0$/-1s/\\"/"/g
        let b:current_format="ctl"
    else
        echom "Already in .ctl format!"
    endif
endfunction

" Reverse replacement
function ToPnl()
    if b:current_format == "ctl"
        g/"main()$/+1,/^" 0$/-1s/"/\\"/g
        let b:current_format="pnl"
    else
        echom "Already in .pnl format!"
    endif
endfunction
