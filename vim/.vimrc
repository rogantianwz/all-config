set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'elzr/vim-json'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/pythoncomplete'
call vundle#end()
syntax on
filetype plugin indent on
filetype plugin on

"将自动缩进设置为4个字符 
set shiftwidth=4

"将tab位设置为4个字符，默认是8
set tabstop=4

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"CTRLP配置
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = 'target'
":map <space> :CtrlPMRU <cr>
:map <space> :CtrlP <cr>
let g:ctrlp_by_filename = 1

"设置自动补全
""set wildmenu
"set wildmode=longest:full
"set completeopt+=longest "让vim的补全菜单行为与一般IDE一致
"" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
"回车即选中当前项
"inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
""上下左右键的行为
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
let g:acp_completeoptPreview = 1 "AutoComplPop插件， 在补全处显示文档（预览）

"默认是\
let mapleader=','
"将vim默认的蓝颜色的注释改成绿色
highlight Comment ctermfg=green guifg=green
