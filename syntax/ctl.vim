" Vim syntax file
" Language:	CONTROL (WinCC-OA)
" Current Maintainer:	burneyy (https://github.com/burneyy/vim-winccoa)
" Previous Maintainer:	-
" Last Change:	2018 Dec 13

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Read the C++ syntax to start with
runtime! syntax/cpp.vim
unlet b:current_syntax

" From WinCC OA Online Help -> Contents -> CONTROL -> Data types
syn keyword ctlType anytype atime bit32 bit64 blob bool char double errClass file float
syn keyword ctlType function_ptr int uint long ulong langString mixed mapping va_list
syn keyword ctlType string time unsigned shape

" Dynamic arrays
syn keyword ctlType dyn_anytype dyn_atime dyn_bit32 dyn_bit64 dyn_blob dyn_bool dyn_char
syn keyword ctlType dyn_double dyn_errClass dyn_file dyn_float dyn_function_ptr dyn_int
syn keyword ctlType dyn_uint dyn_long dyn_ulong dyn_langString dyn_mixed dyn_mapping va_list
syn keyword ctlType dyn_string dyn_time dyn_unsigned dyn_shape

" Dynamic - Dynamic arrays
syn keyword ctlType dyn_dyn_anytype dyn_dyn_atime dyn_dyn_bit32 dyn_dyn_bit64 dyn_dyn_blob dyn_dyn_bool
syn keyword ctlType dyn_dyn_char dyn_dyn_double dyn_dyn_errClass dyn_dyn_file dyn_dyn_float
syn keyword ctlType dyn_dyn_function_ptr dyn_dyn_int dyn_dyn_uint dyn_dyn_long dyn_dyn_ulong
syn keyword ctlType dyn_dyn_langString dyn_dyn_mixed dyn_dyn_mapping dyn_va_list
syn keyword ctlType dyn_dyn_string dyn_dyn_time dyn_dyn_unsigned dyn_dyn_shape

hi def link ctlType Type

" WinCC OA library
" Miscellaneous functions                                                                                                              
syn keyword ctlFunc Debug DebugN DebugFN DebugFTN DebugTN getStackTrace 
hi def link ctlFunc Function


let b:current_syntax = "ctl"
