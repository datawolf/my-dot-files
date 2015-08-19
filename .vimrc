" ~/.vimrc (configuration file for vim only)

set number
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set ruler
set cursorline
set hlsearch
set showcmd
set incsearch
set history=500
set showmatch
set autoindent
set paste
filetype plugin indent on
syn on se title

if ! has("gui_running")
    set t_Co=256
endif

if &diff
    "colors 
endif

syntax on

highlight Comment cterm=underline ctermfg=white ctermbg=blue
"-----------------------------------------------------"
"  Tag List 环境设置
"-----------------------------------------------------"
"nnoremap <silent> <F8> :TlistToggle<CR>
filetype on
nmap <F8> :TlistToggle<CR>
let Tlist_Auto_Open = 0
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Use_Right_Window=0
let Tlist_Show_One_File=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=0

function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	let login = system('whoami')
	if v:shell_error
	   let login = 'unknown'
	else
	   let newline = stridx(login, "\n")
	   if newline != -1
		let login = strpart(login, 0, newline)
	   endif
	endif
	let hostname = system('hostname -f')
	if v:shell_error
	    let hostname = 'localhost'
	else
	    let newline = stridx(hostname, "\n")
	    if newline != -1
		let hostname = strpart(hostname, 0, newline)
	    endif
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

hi Comment ctermfg=6
" ~/.vimrc ends here
