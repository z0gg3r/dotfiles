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
colo elflord

call plug#begin('/home/zocki/.vim/plugged')
	Plug 'reedes/vim-pencil'
	Plug 'vim-airline/vim-airline'
"	Plug 'preservim/tagbar'
	Plug 'majutsushi/tagbar'
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-easytags'
	Plug 'tpope/vim-fugitive'
	Plug 'ollykel/v-vim'
	Plug 'junegunn/goyo.vim'
	Plug 'rust-lang/rust.vim'
call plug#end()

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

" Nmaps
nmap <F5> :PlugUpgrade<CR>:PlugUpdate<CR>
nmap <F4> :TagbarToggle<CR>
nmap <F6> :Goyo<CR>
nmap <F10> :RustFmt<CR>
nmap <F7> :call pencil#init({'wrap': 'hard'})<CR>
nmap <F8> :call deadkeys#ToggleDeadKeys()<CR>

" Tagbar customs

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
