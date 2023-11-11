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

set viminfofile=NONE

call plug#begin('/home/zocki/.vim/plugged')
	Plug 'reedes/vim-pencil'
	Plug 'vim-airline/vim-airline'
	Plug 'majutsushi/tagbar'
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-easytags'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/goyo.vim'
	Plug 'rust-lang/rust.vim'
	Plug 'w0rp/ale'
	Plug 'tpope/vim-commentary'
	Plug 'liuchengxu/space-vim-dark'
	Plug 'rhysd/vim-clang-format'
call plug#end()

set background=dark
colorscheme space-vim-dark

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text		call pencil#init({'wrap': 'hard'})
augroup END

let g:pencil#textwidth = 80

set list
set lcs=tab:>-<,lead:… " lead requires vim8.2+

" Airline config
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
" Nmaps
nmap <F2> :set hlsearch!<CR>
nmap <F3> :PlugUpgrade<CR>:PlugUpdate<CR>
nmap <F4> :TagbarToggle<CR>
nmap <F5> :call pencil#init({'wrap': 'hard'})<CR>
nmap <F6> :PencilOff<CR>
nmap <F7> :ClangFormat<CR>

let g:ale_c_cc_executable = 'gcc'
let g:ale_c_cc_options = '-pipe -march=native -std=c99 -fstack-protector-strong -fcf-protection -fpie -fPIC -fno-delete-null-pointer-checks -Wall -Wextra -D_DEFAULT_SOURCE'
let g:ale_virtualtext_cursor = 0

let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 0
let g:clang_enable#fallback_style = 0
let g:clang_format#extra_args = "--style='file:/home/zocki/.clang-format'"

let g:rust_recommended_style = 0

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
