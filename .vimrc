"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        optimizasean                         "
"                           .vimrc                            "
"                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" System Settings                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fixes bugs and helps override system vim
set nocompatible

" Enable vim color syntax highlighting
syntax on

" Sets detection, plugin and indent on
" https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
filetype plugin indent on

"Set special character for custom commands
let mapleader = "\\"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup settings                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sound Settings                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set belloff=all

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable 256 colors palette in Gnome Terminal
set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Avoid garbled characters (Chinese fonts)
let $LANG='en'
set langmenu=en

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface Settings                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show when vim is waiting for a followup motion key (i.e. leader + ?, d + ?, so on)
set showcmd

" Show row column % in bottom toolbar
set ruler

" Show line numbers
set number

" Highlight current line(May lag lock up when mouse scrolling)
" set cursorline

" Hide buffers when they are abandoned
set hid

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Show the statusline
" set laststatus=2

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Height of the command bar
set cmdheight=1

" Add a bit extra margin to the left
set foldcolumn=0

" Enable linebreak
set linebreak

" Break line at 500 char
set textwidth=500

" Broken line prefix
set showbreak=+++

" No highlight
map <Leader><Space> :noh<CR>

" Disable highlight when <Leader><CR> is pressed
map <silent> <Leader><CR> :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable folding
set foldenable

" Fold level: only X nests down get folded(0 is fold all, 99 is fold never)
" set foldlevelstart=15

" Set fold trigger to indent based (can also use marker, manual, expr, syntax, diff, ...)
set foldmethod=manual

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete Wildmenu                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the Wild menu for command autocompletion
set wildmenu

" Options displayed for autocompletion
set wildmode=full

" Ignore autocomplete for certain files
set wildignore=*.o,*~,*.pyc,*/.hg/*,*/.svn/*,*/.DS_Store

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert tabs to spaces
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set tabstop=8
set softtabstop=4
set shiftwidth=4

" Smart indent and wrapping
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Tab settings for specific files
" HTML - I prefer 4 for readability
" autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2

" JavaScript - I prefer 4 for readability
" autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

" JSON - 2 is standard for compression but 4 is better for readability 
" autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Markdown - some linters want 2 although CommonMark spec disagrees - see ordered list v.s. unordered list - also many renderers may not like 2 (mdv, sometimes pandoc, ...)
" autocmd FileType markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2 

" YAML - suggests 2 spaces but I personally prefer 4 and you generally use either 2 or 4
" autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 

" Python - suggests 2, as long as consistent it will work though but most linters want 2
autocmd FileType python setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Ruby - suggests 2, as long as consistent it will work though but most linters want 2
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows, Tabs, and Buffers                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <Space> /
map <C-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <Leader>bd :Bclose<CR>:tabclose<CR>gT

" Close all the buffers
map <Leader>ba :bufdo bd<CR>

map <Leader>l :bnext<CR>
map <Leader>h :bprevious<CR>

" Useful mappings for managing tabs
map <Leader>t+ :tabnew<CR>
map <Leader>to :tabonly<CR>
map <Leader>tc :tabclose<CR>
map <Leader>tm :tabmove
map <Leader>t<Leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <Leader>te :tabedit <C-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
map <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Regular Expressions and Searching                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For regular expressions turn magic on
set magic

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell Check                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <Leader>ss :setlocal spell!<CR>

" Spell next
map <Leader>sn ]s

" Spell previous
map <Leader>sp [s

" Spell add(save)
map <Leader>sa zg

" Spell what(list)
map <Leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remapping Native Vim                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Configure backspace so it behaves
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
map <Leader>pp :setlocal paste!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       PLUGINS                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            Vim Website https://www.vim.org/                 "
"           VimAwesome https://vimawesome.com/                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen                                                    "
" vim-pathogen                                                "
" https://github.com/tpope/vim-pathogen                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use pathogen to install plugins in bundle directory
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Nerd Tree                                               "
" https://github.com/scrooloose/nerdtree                      "
" https://vimawesome.com/plugin/nerdtree-red                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <Leader>nn :NERDTreeToggle<CR>
map <Leader>nb :NERDTreeFromBookmark<Space>
map <Leader>nf :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRU                                                        "
" mru.vim                                                    "
" git clone https://github.com/vim-scripts/mru.vim           "
" https://vimawesome.com/plugin/mru-vim                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <Leader>f :MRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YankStack                                                   "
" https://github.com/maxbrunsfeld/vim-yankstack               "
" https://vimawesome.com/plugin/yankstack                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim visual multi                                            "
" vim-visual-multi                                            "
" https://github.com/mg979/vim-visual-multi                   "
" https://vimawesome.com/plugin/vim-multiple-cursors          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" \\ to start visual multi (<Leader><VM_leader>)
" Set specific leader for program
let g:VM_leader = '\'

" Disable default mappings
let g:multi_cursor_use_default_mapping=0

" Disable permanent mappings
let g:VM_default_mappings = 0

" Create the hash to fill with user preferences
let g:VM_maps = {}

" Default permanent mappings
let g:VM_maps['Find Under']                  = '<C-n>'
let g:VM_maps['Find Subword Under']          = '<C-n>'
let g:VM_maps["Select All"]                  = '\\A' 
let g:VM_maps["Start Regex Search"]          = '\\/'
let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
let g:VM_maps["Add Cursor At Pos"]           = '\\\'
let g:VM_maps["Visual Regex"]                = '\\/'
let g:VM_maps["Visual All"]                  = '\\A' 
let g:VM_maps["Visual Add"]                  = '\\a'
let g:VM_maps["Visual Find"]                 = '\\f'
let g:VM_maps["Visual Cursors"]              = '\\c'

" Permanent mappings not enabled by default
"let g:VM_maps["Select Cursor Down"]          = '<M-C-Down>'
"let g:VM_maps["Select Cursor Up"]            = '<M-C-Up>'
"let g:VM_maps["Erase Regions"]               = '\\gr'
"let g:VM_maps["Mouse Cursor"]                = '<C-LeftMouse>'
"let g:VM_maps["Mouse Word"]                  = '<C-RightMouse>'
"let g:VM_maps["Mouse Column"]                = '<M-C-RightMouse>'

" VM buffer mappings
let g:VM_maps["Switch Mode"]                 = '<Tab>'
let g:VM_maps["Find Next"]                   = ']'
let g:VM_maps["Find Prev"]                   = '['
let g:VM_maps["Goto Next"]                   = '}'
let g:VM_maps["Goto Prev"]                   = '{'
let g:VM_maps["Seek Next"]                   = '<C-f>'
let g:VM_maps["Seek Prev"]                   = '<C-b>'
let g:VM_maps["Skip Region"]                 = 'q'
let g:VM_maps["Remove Region"]               = 'Q'
let g:VM_maps["Invert Direction"]            = 'o'
let g:VM_maps["Find Operator"]               = "m"
let g:VM_maps["Surround"]                    = 'S'
let g:VM_maps["Replace Pattern"]             = 'R'
let g:VM_maps["Tools Menu"]                  = '\\`'
let g:VM_maps["Show Registers"]              = '\\"'
let g:VM_maps["Case Setting"]                = '\\c'
let g:VM_maps["Toggle Whole Word"]           = '\\w'
let g:VM_maps["Transpose"]                   = '\\t'
let g:VM_maps["Align"]                       = '\\a'
let g:VM_maps["Duplicate"]                   = '\\d'
let g:VM_maps["Rewrite Last Search"]         = '\\r'
let g:VM_maps["Merge Regions"]               = '\\m'
let g:VM_maps["Split Regions"]               = '\\s'
let g:VM_maps["Remove Last Region"]          = '\\q'
let g:VM_maps["Visual Subtract"]             = '\\s'
let g:VM_maps["Case Conversion Menu"]        = '\\C'
let g:VM_maps["Search Menu"]                 = '\\S'
let g:VM_maps["Run Normal"]                  = '\\z'
let g:VM_maps["Run Last Normal"]             = '\\Z'
let g:VM_maps["Run Visual"]                  = '\\v'
let g:VM_maps["Run Last Visual"]             = '\\V'
let g:VM_maps["Run Ex"]                      = '\\x'
let g:VM_maps["Run Last Ex"]                 = '\\X'
let g:VM_maps["Run Macro"]                   = '\\@'
let g:VM_maps["Align Char"]                  = '\\<'
let g:VM_maps["Align Regex"]                 = '\\>'
let g:VM_maps["Numbers"]                     = '\\n'
let g:VM_maps["Numbers Append"]              = '\\N'
let g:VM_maps["Zero Numbers"]                = '\\0n'
let g:VM_maps["Zero Numbers Append"]         = '\\0N'
let g:VM_maps["Shrink"]                      = "\\-"
let g:VM_maps["Enlarge"]                     = "\\+"
let g:VM_maps["Toggle Block"]                = '\\<BS>'
let g:VM_maps["Toggle Single Region"]        = '\\<CR>'
let g:VM_maps["Toggle Multiline"]            = '\\M'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale                                                         "
" Asynchronus Lint Engine                                     "
" https://github.com/w0rp/ale                                 "
" https://vimawesome.com/plugin/ale                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Set Linters for ALE
let g:ale_fixers = {}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline                                                     "
" vim-airline-superman                                        "
" https://github.com/vim-airline/vim-airline                  "
" https://vimawesome.com/plugin/vim-airline-superman          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install powerline any directory
" git clone https://github.com/powerline/fonts.git --depth=1
" cd fonts
" ./install.sh
" cd ..
" rm -rf fonts
" GOOD TO GO!
" Integrates with Powerline fonts
" https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

" If not populated we can populate ourself to set the symbols
" if !exists('g:airline_symbols')
    " let g:airline_symbols = {}

    " unicode symbols - used to render icons if font failure - uncomment if fonts are not patched and not being set right
    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = '◀'
    " let g:airline_symbols.linenr = '␊'
    " let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    " let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols - used to render icons when font works - comment these if using patched fonts and symbols not being set
    " let g:airline_left_sep = ''
    " let g:airline_left_alt_sep = ''
    " let g:airline_right_sep = ''
    " let g:airline_right_alt_sep = ''
    " let g:airline_symbols.linenr = ''
    " let g:airline_symbols.branch = ''
    " let g:airline_symbols.readonly = ''
" endif

" Define which plugins integrate for performance
" let g:airline_extensions = []

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive                                                    "
" FUGITIVE.VIM                                                "
" https://github.com/tpope/vim-fugitive                       "
" https://vimawesome.com/plugin/fugitive-vim                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive .git/tags support removed in favor of `:set tags^=./.git/tags;`
:set tags^=./.git/tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-surround                                                "
" surround.vim                                                "
" https://github.com/tpope/vim-surround                       "
" https://vimawesome.com/plugin/surround-vim                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set to 0 if you want to enable it later via :RainbowToggle or 1 to be always active
let g:rainbow_active = 0

" Configure for custom colors and behaviors - defaults below
" let g:rainbow_conf = {
" \    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
" \    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \    'guis': [''],
" \    'cterms': [''],
" \    'operators': '_,_',
" \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
" \    'separately': {
" \        '*': {},
" \        'markdown': {
" \            'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
" \        },
" \        'lisp': {
" \            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], "lisp needs more colors for parentheses :)
" \        },
" \        'haskell': {
" \            'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], "the haskell lang pragmas should be excluded
" \        },
" \        'vim': {
" \            'parentheses_options': 'containedin=vimFuncBody', "enable rainbow inside vim function body
" \        },
" \        'perl': {
" \            'syn_name_prefix': 'perlBlockFoldRainbow', "solve the [perl indent-depending-on-syntax problem](https://github.com/luochen1990/rainbow/issues/20)
" \        },
" \        'stylus': {
" \            'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], "[vim css color](https://github.com/ap/vim-css-color) compatibility
" \        },
" \        'css': 0, "disable this plugin for css files
" \    }
" \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-floaterm                                                "
" floaterm.vim                                                "
" https://github.com/voldikss/vim-floaterm                    "
" https://vimawesome.com/plugin/vim-floaterm                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_new = '<Leader>tn'
let g:floaterm_keymap_kill = '<Leader>tk'
let g:floaterm_keymap_toggle = '<Leader>tt'
let g:floaterm_keymap_show = '<Leader>ts'
let g:floaterm_keymap_hide = '<Leader>th'
let g:floaterm_keymap_next = '<Leader>t]'
let g:floaterm_keymap_prev = '<Leader>t['
let g:floaterm_keymap_first = '<Leader>t<'
let g:floaterm_keymap_last = '<Leader>t>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commentary.vim                                              "
" commentary.vim                                              "
" https://github.com/tpope/vim-commentary                     "
" https://vimawesome.com/plugin/commentary-vim                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To add more file types (example is apache which uses # and has a space after it:
" autocmd FileType apache set commentstring=#\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" surround.vim                                                "
" surround.vim                                                "
" https://github.com/tpope/vim-surround                       "
" https://vimawesome.com/plugin/surround-vim                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf                                                         "
" fzf.vim                                                     "
" https://github.com/junegunn/fzf                             "
" https://vimawesome.com/plugin/fzf                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: Pure fzf wrapper of terminal utility, no commands

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf:heart:vim                                               "
" fzf.vim                                                     "
" https://github.com/junegunn/fzf.vim                         "
" https://vimawesome.com/plugin/fzf-vim                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wrapper of fzf adding command assistance
" Requires fzf 0.23.0 or higher to be installed: https://github.com/junegunn/fzf
" Note: Ag requires the silver searcher (ag): https://github.com/ggreer/the_silver_searcher
" Note: Rg requires ripgrep (rg): https://github.com/BurntSushi/ripgrep
" Note: Tags and Helptags require Perl
" Note: For syntax highlighted preview, install bat: https://github.com/sharkdp/bat

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Functions                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

