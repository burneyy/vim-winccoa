# vim-winccoa
Simple Syntax Highlighting and additional Features to view and edit WinCC-OA Control Scripts and Panels.

# Installation
Using `vim-plug`, simply can be installed by inserting `Plug 'burneyy/vim-winccoa'` into the vimrc.

# Features
1. Syntax highlighting for `.ctl`, `.pnl` and `.pnl.bak` files (C-like syntax)
2. For CTRL scripts , the command `SyntaxCheck [<projName>]`is provided to perform a syntax check using the underlying shell command `WCCOActrl -syntax -proj <projName> -log +stderr <thisFile>.ctl` (see [here](https://readthedocs.web.cern.ch/display/ICKB/WinCC+OA+3.15+-+CTRL+Language#WinCCOA3.15-CTRLLanguage-WinCCOAHelpReference)). If no project name is provided, it takes the `-currentproj` as default.
3. For `.pnl` and `.pnl.bak` files, the command `SwapQuotes` is provided which allows to swap escaped quotes (`\"`) with normal quotes (`"`) and vice versa. The motivation for this is that these files are filled with lots of meta-information that are containing normal quotes - in contrast to the actual code that is containing escaped quotes. The command swaps the different types of quotes so that the normal quotes are used within the actual code.
4. A mechanism is provided that automatically uses the `SwapQuotes` command when opening `.pnl` and `.pnl.bak` files - and swaps the quotes back again when writing the buffer back to the file. To disable this feature, put the line  
```let g:winccoa_pnl_auto_swapquotes = 0```  
into your vimrc.
