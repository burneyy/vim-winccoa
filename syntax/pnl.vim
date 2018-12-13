" Vim syntax file
" Language:	CONTROL-panels (WinCC-OA)
" Current Maintainer:	burneyy (https://github.com/burneyy/vim-winccoa)
" Previous Maintainer:	-
" Last Change:	2018 Dec 13

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Read the CONTROL/ctl syntax to start with
runtime! syntax/ctl.vim
unlet b:current_syntax

" Also highlight escaped quotes as quotes
syntax region pnlString start=/\v\\"/ end=/\v\\"/ end=/\v$/
highlight link pnlString String

let b:current_syntax = "pnl"
