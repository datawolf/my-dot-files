" ~/.vimrc (configuration file for vim only)

set list
set listchars=tab:>-,trail:-
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
set autoindent
set paste
set autowrite   " 自动保存
set foldmethod=syntax
set foldlevel=100  " 启动vim时不要自动折叠代码
set textwidth=80
set formatoptions+=t
set cindent
set smartindent
set noerrorbells
set showmatch
set nobackup
set noswapfile

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


set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
Plugin 'tpope/vim-fugitive'
Plugin 'rosstimson/bats.vim'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
"Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}


Plugin 'majutsushi/tagbar'	"Tag bar"
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline' | Plugin 'vim-airline/vim-airline-themes' " Status line"

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件


"============== Tag bar ================================
let g:tarbar_width=25
autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()

" ==============YCM==============
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
  " YCM 查找定义
let mapleader=','
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_collect_identifiers_from_tags_files = 1

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0  " 关闭函数原型提示

let g:ycm_show_diagnostics_ui = 0 " 关闭诊断信息
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2  " 两个字符触发 补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 收集
let g:ycm_complete_in_strings=1

noremap <c-z> <NOP>
let g:ycm_key_invoke_completion = '<c-z>'   " YCM 里触发语义补全有一个快捷键
let g:ycm_max_num_candidates = 15  " 候选数量

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }


" =======echodoc 显示函数参数===========
" ctags -R --fields=+lS .

"======= NetRedTree=========
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeWinSize=20
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"

let g:winManagerWindowLayout='TagList'
nmap wm :WMToggle<cr>


" ========airline状态栏=========
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline_section_c = '%t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_y = ''


" ===============================================
" 禁止方向键
" ===============================================
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
