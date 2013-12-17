if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" 2013.10.15.11.32
" 2013.12.5.17.24   add  F5 to time ,bash head
" setting

		" noremal setting
			set nu 
			set smartindent
			set tabstop=4
			set softtabstop=4
			set shiftwidth=4
			let &termencoding=$encoding
			set fileencoding=utf-8
			set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk
			set fenc=utf-8
			colorscheme torte
		"remove some bar 
			set guioptions-=m  "Remove menubar"
			set guioptions-=T  "Remove toolbar"
			set guioptions-=r  "Remove v_scroll bar" 
			set ruler
			
			"no auto huan_hang
			"set nowrap
		
		" read the file with utf-8
			set encoding=utf-8

		" set the menu & the message to Chinese
			" set langmenu=zh_CN.UTF-8
			" let $LANG= 'zh_CN.UTF-8'
			" source $VIMRUNTIME/delmenu.vim
			" source $VIMRUNTIME/menu.vim

		" set the menu & the message to English
			set langmenu=en_US.UTF-8
			language message en_US.UTF-8
			let $LANG= 'en_US'
			source $VIMRUNTIME/delmenu.vim
			source $VIMRUNTIME/menu.vim

		" full screen
			autocmd GUIEnter * simalt ~x

		" don't generate .swp file after edit file 
			set nobackup
		" php manual setting
			autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"	
	    	set runtimepath +=C:\phpmanual


" map

		" map tips:	
			"you can use char 'v' and char '\' to add map ,because it have a
			"lot of empty two char  

		" path map 
			map ve :e D:\wamp\bin\apache\Apache2.4.4\conf\extra\httpd-vhosts.conf <cr>
			map vc :e /etc/vimrc <cr> 
			map vm :e /etc/hosts <cr>
			map vn :e E:\work_zhang\work\5_soft\4.vim\4.vim_setting.txt <cr>
			map vz :e E:\work_zhang\work\3_journal\1_journal_day.txt <cr>
			map vr :e E:\work_zhang\work\3_journal\2_english_good_sentence.txt <cr>
			map vg :e E:\work_zhang\work\5_soft\19_auto_hot_key\ahk_zsj.ahk <cr>
			map vx :e E:\work_zhang\work\12_web_frame\duxcms1.1.0稳定版\2_tags\canphp标签调用.txt <cr>

		" command map 
			map vd :bd% <cr>
			map vo :bp <cr> <cr>
			map vp :bn <cr>
			map vq :wq! <cr>
			map vs :w <cr>
			map vh :help <cr>
			"map <space> <PageDown>
			map ;a <CTRL-w>
			map vy :g/^\s*$/d<cr>
			map ;k :%s/^\s\+//g <cr>
			map ntime :call strftime("%Y-%d")
			" add "F6" to print time  add 2013.12.5
		    nnoremap <F6> "=strftime("%F")<CR>gP
			inoremap <F6> <C-R>=strftime("%F")<CR>
		

			"tab map
				"map t :tabnew <cr>
				"map w :tabp <cr>
				map vt :tabclose <cr>
				map e :tabn <cr>
        " macro map  
			" canphp
				ab  chead 	
							\<title>{$common.title}</title> <cr>
							\<meta name="keywords" content="{$common.keywords}" /> <cr>
							\<meta name="description" content="{$common.description}" /> 
				ab  ihead 
							\<title>{$sys.seoname}-{$sys.sitename}</title> <cr>
							\<meta name="keywords" content="{$sys.keywords}" /> <cr>
							\<meta name="description" content="{$sys.description}" /> 
				ab  zfoot 
							\<!--#include file="foot.html"-->
				ab  zhead  
							\<!--#include file="head.html"-->
				ab  zleft 
							\<!--#include file="left_side.html"-->
				ab  znav 
							\<!--list:{table="category" type="top" order="cid asc" limit="7"}--> <cr>
							\	<a href="{$list.curl}" target="_self" class=menumain_dolphin> <cr>
							\		<span>{$list.name}</span> <cr>
							\	</a>  <cr>
							\<!--/list--> 
			    ab  zroll 
							\<!--list:{table="category" pid="2" order="cid asc" limit="5"}--> <cr>
							\	<!--product:{table="content"  cid="<$list.cid>" order="updatetime desc" limit="12"}--> <cr>
							\			<div class=box> <cr>
							\				<div style="WIDTH: 120px; HEIGHT: 120px" class=fang> <cr>
							\					<div style="WIDTH: 120px; HEIGHT: 120px" class=picFit> <cr>
							\						<A href="{$product.aurl}" target=_self> <cr>
							\							<IMG border=0 src="{$product.image}" width=120 height=120> <cr>
							\						</A>  <cr>
							\					</div> <cr>
							\				</div> <cr>
							\				<A class=prodtitle href="{$product.aurl}" target=_self>{$product.title}</A> <cr>
							\			</div> <cr>
							\	<!--/product--> <cr>
							\<!--/list--> 
				ab  zcompanypicture 
							\<!--sublist:{table="category" cid="1" order="cid asc" limit="5"}--> <cr>
							\	 <a href="{$sublist.curl}"> <cr>
							\		<img width="256px" height="300px" src="{$sublist.image}"> <cr>
							\	 </a> <cr>
							\<!--/sublist-->
				ab  zleftproduct 
							\<!--list:{table="category" pid="2" order="cid desc" limit="5"}--> <cr>
							\	<a class=productclass_dolphin href="{$list.curl}" target=_self>{$list.name}</a> <cr>
							\<!--/list-->
				ab  znewslist 
							\<!--content:{table="content" cid="4" order="updatetime desc" limit="7"}--> <cr>
							\	<li class=newslist_1><A class=newslist_1  <cr>
							\		href="{$content.aurl}" <cr> 
							\		target="">{$content.title}</A></li> <cr>
							\<!--/list-->
				ab  zproductlist 
							\<!--foreach:{$loop $vo}--> <cr>
							\  <li><h3><a href="{$vo.aurl}" title="{$vo.titlex}">{$vo.titlex}</a></h3><span>{$vo.updateime time="Y-m-d"}</span></li> <cr>
							\<!--/loop-->
				ab  zservice  
							\<!--service:{table="content"  cid="11" order="updatetime desc" limit="12"}--> <cr>
							\<li><img src="{$service.image}" width="108" height="144" alt="yewu"/></li>
							\<!--/service--> <cr>
				ab zcompanyprofile 
							\<!--list:{table="category_page" cid="1"  limit="1"}--> <cr>
							\{$list.content html}[<a  href="{$list.curl}">详细</a>] <cr>
							\<!--/list-->
				ab webinfo 
							\网站地址：<cr>
							\网站后台地址：<cr>
							\网站后台用户名：<cr>
							\网站后台密码:
				ab imagelist 
							\<!--list:{table="content" image="true" order="updatetime desc" limit="4"}-->
				ab newslist 
							\<!--list:{table="content" order="updatetime desc" limit="10"}-->
			    ab randlist 
							\<!--list:{table="content" rand="true" limit="9"}-->
				ab position 
							\当前位置： <a href="__APP__/">首页</a><!--foreach:{$nav $list}--> ›› <a href="{$list.curl}" >{$list.name}</a><!--/list-->
				ab leftlist 
							\<!--list:{table="category" pid="<$top_category.cid>" order="cid desc" limit="5"}-->
				"mysql
					ab myh  
							\/*!40101 SET @saved_cs_client     = @@character_set_client */; <cr>
							\/*!40101 SET character_set_client = utf8 */;
					ab mye 
							\/*!40101 SET character_set_client = @saved_cs_client */;
			    " bash head 
				    ab bh 
						\#!/bin/bash <cr>
						\# Description:  this program <cr>
						\# Editor:       zhangshijie <cr>
						\# Email:		 406358964@qq.com <cr>
						\# Version:      1.0 <cr>
						\# History:      <F6> creat zsj

				" php head
				"


						



				
		
" other
		" weiBo  
			let g:weibo_access_token='C1DC586CEA8332614E8C2687730FD55B'
	
" source 
		" my fist function
			"source E:\work_zhang\work\5_soft\4.vim\7_my_vim_function\1_common.vim

" plugin_setting

		" winManager	
 
				"设置界面分割
				"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
				"let g:winManagerWindowLayout = "FileExplorer|TagList,BufExplorer"
				"let g:winManagerWindowLayout = 'NERDTree|TagList,BufExplorer'
				"let g:winManagerWindowLayout="TagList,BufExplorer"
				let g:winManagerWindowLayout = 'NERDTree,BufExplorer'
		
			
				"设置winmanager的宽度，默认为25
				let g:winManagerWidth = 35
				"定义打开关闭winmanager按键 这里定义为F11
				nmap <silent> ;j :WMToggle<cr>
				"在进入vim时自动打开winmanager

				let g:AutoOpenWinManager = 1
				

		" ctags 	
				"生成一个tags文件
				nmap <f9> <esc>:!ctags -r *<cr>

		" taglist	
				" 这项必须设定，否则出错,配置taglist的ctags路径
				let Tlist_Ctags_Cmd = 'D:\ctags58\ctags.exe'

				" 不同时显示多个文件的 tag ，只显示当前文件的
				let Tlist_Show_One_File=1

				" 如果 taglist 窗口是最后一个窗口，则退出 vim
				let Tlist_Exit_OnlyWindow=1

				"让当前不被编辑的文件的方法列表自动折叠起来
				let tlist_file_fold_auto_close=1

				"把taglist窗口放在屏幕的右侧，缺省在左侧
				let Tlist_Use_Right_Window=1

				"显示taglist菜单
				let tlist_show_menu=1

				"启动vim自动打开taglist
				let Tlist_Auto_Open=1
		" cscope
				"cs a E:\work_zhang\work\14_work\web\2_company_zhong\2_dynamic_web\canphp\cscope.out

		" txtBrowser
				syntax on
				filetype plugin on
				au BufEnter *.txt setlocal ft=txt
				let TxtBrowser_Dict_Url='http://dict.cn/text'

		" NERDTree
				"let NERDTRee_Auto_Open=1
		
		" miniBufExpl
				"let g:miniBufExplMapWindowNavVim = 1
				"let g:miniBufExplMapWindowNavArrows = 1
				"let g:miniBufExplMapCTabSwitchBufs = 1
				"let g:miniBufExplMSelTarget = 1
				"let g:miniBufExplMoreThanOne = 0

		" bufexplorer





