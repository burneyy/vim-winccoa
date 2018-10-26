runtime! syntax/cpp.vim

syntax region pnlString start=/\v\\"/ end=/\v\\"/
highlight link pnlString String

let b:current_syntax = "pnl"
