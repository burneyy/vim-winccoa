runtime! ftplugin/cpp.vim

" Function to perform syntax check using WCCOActrl -syntax
" one optional argument: the project (if not specified takes the -currentproj)
command! -nargs=? SyntaxCheck call SyntaxCheck(<args>)
function! SyntaxCheck(...)
    let l:proj = "-currentproj"
    if a:0 > 0
        let l:proj = "-proj " . a:1
    endif
    " Get filename and extract /scripts/... substring from it
    let l:fname = expand('%:p')
    let l:fname_trunc = matchstr(l:fname, "/scripts/.*", 0)
    if l:fname_trunc == ""
        echoerr 'Could not extract "/scripts.*" from "' . l:fname . '"!'
    endif
    let l:ctrlscript = substitute(l:fname_trunc, "/scripts/", "", "")

    execute "!WCCOActrl -syntax " . l:proj . " -log +stderr " . l:ctrlscript

endfunction

