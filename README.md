# vim-winccoa
Simple Syntax Highlighting and additional Features to view and edit WinCC-OA Control Scripts and Panels.

# Installation
Using `vim-plug`, simply can be installed by inserting `Plug 'burneyy/vim-winccoa'` into the vimrc.

# Features
1. Syntax highlighting for `.ctl`, `.pnl` and `.pnl.bak` files (C-like syntax)
2. For `.pnl` and `.pnl.bak` files, the command `SwapQuotes` is provided which allows to swap escaped quotes (`\"`) with normal quotes (`"`) and vice versa. The motivation for this is that these files are filled with lots of meta-information that are containing normal quotes - in contrast to the actual code that is containing escaped quotes. The command swaps the different types of quotes so that the normal quotes are used within the actual code.
3. A mechanism is provided that automatically uses the `SwapQuotes` command when opening `.pnl` and `.pnl.bak` files - and swaps the quotes back again when writing the buffer back to the file. To use this feature, put the line  
```let g:winccoa_pnl_auto_swapquotes = 1```  
into your vimrc.
