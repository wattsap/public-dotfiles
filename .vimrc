" @author: Andrew Watts
" @version: 1
" Hey there, if you are reading this you are looking for some particular
" cool trick out of my .vimrc
" everything should be commented clearly.
"*** try and figure out syntastic *** 
"------------------------------------------------------------------------
"                   General helpful features 
"------------------------------------------------------------------------                   
:set nocompatible      " i dont know hwat this does. but its important
:set showmode          " Tell you if you're in insert mode
:set tabstop=4         " Set the tabstop to 4 spaces
:set shiftwidth=4      " Shiftwidth should match tabstop
:set expandtab         " Convert tabs to <tabstop> number of spaces
:set ruler             " Show the cursor position all the time
:set showmatch         " Show matching [] () {} etc...
:set smartindent       " Let vim help you with your code indention
:set formatoptions+=ro " Automatically insert the comment character when you hit <enter> (r) or o/O (o) in a block comment.
:set backspace=2       " makes backspace work like you expect
:set mouse=a           " sets mouse be useable
:set cul               " places a highlighted line under your current line
:set background=dark   " clears semi-filled color and makes it solid
:set wrap              " enables wrapped lines
:set noerrorbells      " i hate the dinging.
:set title             " show filename in titlebar
:set pastetoggle=<F2>  " enables paste when toggled by f2
:set showcmd           " show last command entered in bottom of vim
:set wildmenu          " autocomplete commands
:set ttyfast           " faster terminal
"------------------------------------------------------------------------
"                   Plugins
"-----------------------------------------------------------------------
call pathogen#helptags()
call pathogen#infect()
filetype on            " reguired to use taglist
let Tlist_User_Right_Window  = 1    " this will let me use taglist on the right side of my screen whenever i get tablist installed
autocmd vimenter * NERDTree
" this is my first mapping. i mapped f10 o toggle the nerd tree. I dont totally understand what the cr does but im assuming it means something similar to implement this. im also curious why comments cant be added after the map, they have to be done on the next line
map <F10> :NERDTreeToggle<CR>
"//////////////////////////////////////////////////////////////////////////
"useless stuff
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" //////////////////////////////////////////////////////////////////////
"
" -----------------------------------------------------------------------
"                   Color Schemes
"------------------------------------------------------------------------
" colorscheme badwolf   " interesting color schmme
" colorscheme monokai   " trying out jonjonssons color schem
colorscheme murphy      " green highlighting scheme                
"------------------------------------------------------------------------
"                   Searching
"------------------------------------------------------------------------                
:set nohlsearch        " Don't highlight strings you're searching for
:set incsearch         " search as characters are entered
:set hlsearch          " highlight matches as they are searched
"syntax enable         " enables syntax highlighting
:set smarttab          " smart tabs
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
" both of these will allow for searching stuff highlighted in visual mode
"----------------------------------------------------------------------
"                       Line Numbering
"---------------------------------------------------------------------
:set nu                 " sets line number
"////////////////////////////////////////////////////////////////////////////
"everything in this box isnt working well on vim 7.2 but will be massively
"handy with an update. to check version, use: vim --version
" :set relativenumber     " sets relative line numbers


"autocmd InsertEnter * :setnumber      " when vim enters insert turns on absolute nummbers
"autocmd InsertLeave * :setrelativenumber "when vim leaves insert turns on relative numbers
":au FocusLost * :set number      " switch to absolute numbers when vim is not moving
":au FocusGained * :set relativenumber   " switch back to relative when vim is moving


" this is a function that allows toggling back and forth between absolute and relative line numbers by pressing f-10
" function! NumberToggle()
"   if(&relativenumber == 1) {
"    set number
"  }
"  else {
"    set relativenumber
"  }
"  endif
"endfunc

"nnoremap <F10> :call NumberToggle()<cr>
"////////////////////////////////////////////////////////////////////////////
"-----------------------------------------------------------------------
"                       Folding 
"-----------------------------------------------------------------------                       
:set foldenable        " enable folding of methods/functions
:set foldlevelstart=0  " setting at what level folding will start
:set foldnestmax=10    " cant have more than ten things nested in one area
:set foldmethod=manual " fold based on command
" set foldmethod=indent     "fold based on code indents 
" specific remaps to allow folding open and close on f9 strike
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf 
"------------------------------------------------------------------
"                    fixes for common typos 
"-------------------------------------------------------------------                    
iab anf and
iab adn and
iab ans and
iab teh the
iab tre there
"---------------------------------------------------------------------
"                    shortcuts/remaps
"---------------------------------------------------------------------
iab #i #include<stdio.h>
iab importscan import java.util.Scanner;
iab prf printf(
iab syso System.out.print("
iab sysl System.out.println("
" remap fix indentation command to ff
nnoremap ff gg=G 

"----------------------------------------------------------------------
"                   Tab auto-complete word script
"---------------------------------------------------------------------
 function! SuperTab()
  if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>
                  
"----------------------------------------------------------------------
"                   Stuff specifically put here by the school
"-----------------------------------------------------------------------
" Switch syntax highlighting on, when the terminal can support colors
if &t_Co > 2 || has("gui_running")
    :syntax on
    " Change the highlight color for Comment and Special
    " to Cyan.  Blue is too dark for a black background.
    :highlight Comment  term=bold ctermfg=cyan guifg=cyan
    :highlight Special  term=bold ctermfg=cyan guifg=cyan
    :highlight Constant term=bold ctermfg=red  guifg=cyan
endif

" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
:autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab

" Make vim recognize a file ending in ".template" be a C++ source file
:autocmd BufNewFile,BufRead *.template set ft=cpp
