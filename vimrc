" General config
syntax enable
filetype plugin indent on
set autoindent
set path+=**
set wildmenu
set number
set incsearch
set hlsearch
set history=1024
set nocompatible
set nomodeline
set tabstop=8
set shiftwidth=8
set list
set lcs=tab:>-<,lead:…
set viminfofile=NONE
set background=dark

" Plugin section (below this only plugin stuff)
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
call plug#end()

colorscheme space-vim-dark

" Pencil config
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text		call pencil#init({'wrap': 'hard'})
augroup END

let g:pencil#textwidth = 80

" Airline config
let g:airline_section_b = '%{strftime("%c")} | %{FugitiveStatusline()}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#tabline#formatter = 'unique_tail'
set t_Co=256

" Tagbar config
function! s:tagbar_integration()
endfunction
let g:tagbar_width = max([25, winwidth(0) / 5])
let g:tagbar_show_data_type = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_wrap = 1

" Goyo config
let g:goyo_width = 82

" ALE config
let g:ale_c_cc_executable = 'gcc'
let g:ale_c_cc_options = '-pipe -march=native -std=c99 -fstack-protector-strong -fcf-protection -fpie -fPIC -fno-delete-null-pointer-checks -Wall -Wextra -D_DEFAULT_SOURCE'
let g:ale_virtualtext_cursor = 0

" EasyTags config
let g:easytags_async = 1
let g:easytags_file = '/home/zocki/.cache/vimtags'

" Rust config
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

" Nmaps
nmap <F2> :set hlsearch!<CR>
nmap <F3> :PlugUpgrade<CR>:PlugUpdate<CR>
nmap <F4> :TagbarToggle<CR>
nmap <F5> :call pencil#init({'wrap': 'hard'})<CR>
nmap <F6> :PencilOff<CR>
nmap <F7> :ClangFormat<CR>
