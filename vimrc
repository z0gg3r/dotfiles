syntax enable
filetype plugin indent on

" Set Options
set autoindent
set path+=**
set wildmenu
set number
set incsearch
set hlsearch
set history=1024
set nomodeline
set tabstop=8
set shiftwidth=8

call plug#begin('/home/zocki/.vim/plugged')
	Plug 'reedes/vim-pencil'
	Plug 'vim-airline/vim-airline'
	Plug 'majutsushi/tagbar'
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-easytags'
	Plug 'tpope/vim-fugitive'
	Plug 'ollykel/v-vim'
	Plug 'junegunn/goyo.vim'
	Plug 'rust-lang/rust.vim'
	Plug 'haystackandroid/strawberry'
	Plug 'sainnhe/sonokai'
	Plug 'joshdick/onedark.vim'
	Plug 'brettbar/siena.vim'
	Plug 'scrooloose/syntastic'
	Plug 'valloric/youcompleteme'
	Plug 'dpelle/vim-languagetool'
call plug#end()

colorscheme sonokai

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

let g:pencil#textwidth = 80

" Airline config
let g:airline_section_x = '%{PencilMode()}'
let g:airline_section_b = '%{strftime("%c")} | %{FugitiveStatusline()}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#tabline#formatter = 'unique_tail'
set t_Co=256

function! s:tagbar_integration()
endfunction

" Tagbar config
let g:tagbar_width = max([25, winwidth(0) / 5])
let g:tagbar_show_data_type = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_wrap = 1

let g:goyo_width = 82

let g:spell_on=0
let g:languagetool_jar='$HOME/Downloads/langtool/LanguageTool-5.4/languagetool-commandline.jar'
let g:languagetool_disable_rules='DASH_RULE,UNIT_SPACE'
" Spellchecker
function! Toggle_spell()
	if !g:spell_on
		let g:spell_on=1
		:LanguageToolCheck
	else
		let g:spell_on=0
		:LanguageToolClear
	endif
endfunction

" Nmaps
nmap <F5> :PlugUpgrade<CR>:PlugUpdate<CR>
nmap <F4> :TagbarToggle<CR>
nmap <F8> :Goyo<CR>
nmap <F10> :RustFmt<CR>
nmap <F6> :call pencil#init({'wrap': 'hard'})<CR>
nmap <F7> :call deadkeys#ToggleDeadKeys()<CR>
nmap <F9> :call Toggle_spell()<CR>

if !exists('g:tagbar_type_rust')
    let g:tagbar_type_rust = {
                \ 'ctagstype' : 'rust',
                \ 'kinds' : [
                \'T:types',
                \'f:functions',
                \'g:enumerations',
                \'s:structures',
                \'m:modules',
                \'c:constants',
                \'t:traits',
                \'i:trait implementations',
                \ ]
                \ }
endif

" YCM Allowlist
let g:ycm_filetype_whitelist = {
	\ 'c': 1,
	\ 'rust': 1,
	\ 'python': 1,
	\ 'cpp': 1,
	\ 'java': 1,
	\ 'tcl': 1,
	\ 'd': 1,
	\ 'sh': 1,
	\ 'vlang': 1,
	\ 'css': 1,
	\ 'sql': 1,
	\ 'html': 1,
	\ 'lisp': 1,
	\ 'javascript': 1,
	\ 'php': 1,
	\ 'vim': 1,
	\ 'typescript': 1,
	\ 'scss': 1
	\ }
