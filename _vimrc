set compatible
source $VIMRUNTIME/vimrc_example.vim
" if you are in the linux you need to remove the mswin.vim
"source $VIMRUNTIME/mswin.vim
behave mswin
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"===========================================JamesKid================================================
" Auther     : JamesKid
" Email		 : 1730874730@qq.com
" Blog       : 
" History    : " 2013_11_06_10_32
			   " 2013_12_05_17_24 add F5 to time, bash head
			   " 2013_12_09_18_49 add my own highlight
			   " 2013_12_18_16_01 add canphp tags ab "zrelate", "zlast", "zcontent", "zbread"
			   " 2013_12_21_11_03 add canphp tags ab "laurl", "lcurl", "ltitle", "lupdatetime"
			   " 2013_12_26_17_29 add open taglist in right side use ";l" shortcut 
			   " 2013_12_27_11_49 add "gk", "gj" treat long line as break lines 
			   " 2013_12_27_14_56 fix tab control as ";n", ";w", ";e", ";d"
			   " 2013_12_28_11_27 add auto matching "(", "{" and so on 
			   " 2013_12_28_15_01 add dictionary 
			   " 2013_12_30_11-00 add get time function imap it as ";v"
			   " 2013_12_30_14_53 add rainbow plugin ,map ctrl+w+h and  ctrl+w+l as ;s ;f
			   " 2014_01_07_11_27 add html "file auto control"
			   " 2014_01_07_16_46 add "SetComment"  function to set comment
			   " 2014_01_10_17_20 add tab map "1gt,2gt,2gt ..." to go to tab " 1,2,3..
			   " 2014_01_17_12_17 add font setting 
			   " 2014_01_17_15_45 add txtBroser plugin use tips
               " 2014_01_24_15_45 add map	 "html" one line to multy line's regular expression use ";c"
			   " 2014_02_19_10_16 add plugin easy motion setting 
			   " 2014_02_19_14_24 add ab	 <?php file ?> map as php
			   " 2014_03_04_14_24 add ab     jameskid head
			   " 2014_03_05_11_33 add plugin emmet
			   " 2014_03_07_11_33 add php test time and  test memory
			   " 2014_03_17_11_16 add lookupfile plugin note 
"====================================================================================================

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
			" set helplang=cn    " let the help language to chinese
			"colorscheme desert
			colorscheme torte
			"set ignorecase 
			" No annoying sound on errors
				set noerrorbells
				set novisualbell
				set t_vb=
				set tm=500
			
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
	    	" set runtimepath +=E:\work_zhang\work\5_soft\4.vim\1.vim_plugin\13_php_manual\vim-php-manual
	    	 set runtimepath +=/root/zsj/vim/man/vim-php-manual
			
		" * highlight setting
		    " * example
				" match ErrorMsg /^Error/
			" * add my own highlight setting 
				au BufRead,BufNewFile *.zsj setlocal ft=zsj
				" au BufRead,BufNewFile *.zsj setfiletype html
		" remember last close when open 
		    "set sessionoptions=buffers,curdir,resize,folds,tabpages  
			"autocmd VimLeave * mks! "E:\work_zhang\work\5_soft\4.vim\7_my_vim_function\Session.vim"
			"function s:ReadSession()  
			"	let session_file = "E:\work_zhang\work\5_soft\4.vim\7_my_vim_function\Session.vim"
			"	if filereadable( session_file )  
			"		execute "so " . session_file  
			"	endif  
			"endfunction  
			"autocmd VimEnter * :call s:ReadSession()  


		" auto matching '(','{' and so on "
			":inoremap ( ()<ESC>i
			":inoremap ) <c-r>=ClosePair(')')<CR>
			":inoremap { {}<ESC>i
			":inoremap } <c-r>=ClosePair('}')<CR>
			":inoremap [ []<ESC>i
			":inoremap ] <c-r>=ClosePair(']')<CR>
			":inoremap < <><ESC>i
			":inoremap > <c-r>=ClosePair('>')<CR>
			":inoremap " ""<ESC>i
			":inoremap ' ''<ESC>i
			":inoremap ` ``<ESC>i
			"function ClosePair(char)
			"	if getline('.')[col('.') - 1] == a:char
			"		return "\<Right>"
			"	else
			"		return a:char
			"	endif
			"endf

		" remember the position of the cursor when exit the file
			autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif	

		" dictionary  
			 if has('win32')
				au FileType php setlocal dict+=E:\work_zhang\work\5_soft\4.vim\9_vim_dictionary\php.txt
				"au FileType css setlocal dict+=D:\css.txt
				"au FileType javascript setlocal dict+=D:\javascript.txt
			else
				"au FileType php setlocal dict+=~/.vim/dict/php_funclist.txt
				"au FileType css setlocal dict+=~/.vim/dict/css.txt
				"au FileType javascript setlocal dict+=~/.vim/dict/javascript.txt
			endif  
			set complete-=k complete+=k
		" font setting
			" show what font you have and you can choice one font
				" :set guifont=* 
			" echo what font you now use
				" :echo &guifont
		" color setting
			 "set background=dark
  
" map
		" map tips:	
			"you can use char 'v' and char '\' to add map ,because it have a
			"lot of empty two char  

		" path map 
			" windows
				"map ve :e D:\wamp\bin\apache\Apache2.4.4\conf\extra\httpd-vhosts.conf <cr>
				"map vc :e C:\Program Files\Vim\_vimrc <cr> 
				"map vm :e C:\Windows\System32\Drivers\etc\hosts <cr>
				"map vn :e E:\work_zhang\work\5_soft\4.vim\4.vim_setting.txt <cr>
				"map vz :e E:\work_zhang\work\3_journal\1_journal_day.txt <cr>
				"map vr :e E:\work_zhang\work\3_journal\2_english_good_sentence.txt <cr>
				"map vg :e E:\work_zhang\work\5_soft\19_auto_hot_key\ahk_zsj.ahk <cr>
				"map vx :e E:\work_zhang\work\12_web_frame\duxcms1.1.0稳定版\2_tags\canphp标签调用.txt <cr>
			" linux
				 map vm :e /etc/hosts <cr>
				 map vc :e /usr/local/share/vim/vimrc <cr>

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
			" leader
			let mapleader=","
			let g:mapleader=","
			" add F6 to print time  add 2013.12.5
            nnoremap <F6> "=strftime("%F")<CR>gP
            inoremap <F6> <C-R>=strftime("%F")<CR>
			map ;s <c-w>h 
			map ;f <c-w>l
		  
			"tab map
				map ;n :tabnew <cr>
				map ;d :tabclose <cr>
				map ;w :tabp <cr>
				map ;e :tabn <cr>
				nmap <M-1> 1gt  
				nmap <M-2> 2gt
				nmap <M-3> 3gt
				nmap <M-4> 4gt
				nmap <M-5> 5gt
				nmap <M-6> 6gt
				nmap <M-7> 7gt

			" treat long line as break lines 
				"map j gj
				"map k gk 
				
		"  insert mode diresction
			noremap! <M-j> <Down>
			noremap! <M-k> <Up>
			noremap! <M-h> <left>
			noremap! <M-l> <Right>

        " macro map  
			" canphp
				ab  chead 	
							\<title>{$common.title}</title> <cr>
							\<meta name="keywords" content="{$common.keywords}" /> <cr>
							\<meta name="description" content="{$common.description}" />
				ab  ihead 
							\<title>{$sys.seoname}_{$sys.sitename}</title> <cr>
							\<meta name="keywords" content="{$sys.keywords}" /> <cr>
							\<meta name="description" content="{$sys.description}" />
				ab  zfoot 
							\<!--#include file="foot.html"-->
				ab  zhead  
							\<!--#include file="head.html"-->
				ab  zleft 
							\<!--#include file="left.html"-->
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
				ab zposition 
							\当前位置： <a href="__APP__/">首页</a><!--foreach:{$nav $list}--> ›› <a href="{$list.curl}" >{$list.name}</a><!--/list-->
				ab leftlist 
							\<!--list:{table="category" pid="<$top_category.cid>" order="cid desc" limit="5"}-->
			    ab zrelate  
							\<!--list:{table="content" rand="true" related="<$info.aid>" limit="10"}-->
					        \<li> <span class="line">•</span> <span class="title"><a href="{$list.aurl}" title="{$list.title}">{$list.title len="25"}</a> </span></li>
				            \<!--/list--> 
				ab zlast  
							\<div class="updown">
							\<div class="previous">
							\上一篇：
							\<!--if:{empty($prev)}--> 
							\暂无 
							\<!--{else}--> 
							\<a href="{$prev.aurl}">{$prev.title}</a> 
							\<!--/if--> 
							\</div>
							\<div class="next">
							\下一篇
							\<!--if:{empty($next)}--> 
							\暂无 
							\<!--{else}--> 
							\<a href="{$next.aurl}">{$next.title}</a> 
							\<!--/if--> 
							\</div>
							\</div>
				ab zcontent 
							\作者：{$info.copyfrom}
							\浏览量：{$info.views}
							\发布时间：{$info.updatetime time="Y-m-d h:i:s"}
							\关键字：{$info.keywords tag}
							\内容：{$info.content}
				ab zbread 
							\当前位置： <a href="__APP__/">首页</a><!--foreach:{$nav $list}--> ›› <a href="{$list.curl}" >{$list.name}</a><!--/list--> 
				ab lcurl 
							\{$list.curl}
				ab laurl 
							\{$list.aurl}
				ab ltitle 
							\{$list.title}
				ab lupdatetime 
							\{$list.updatetime time="Y-m-d"}
				ab ztab 
							\<!--list:{table="category" att="list" order="cid asc" limit="2"}--> <cr>
							\<!--content:{table="content" cid="<$list.cid>" order="updatetime desc" limit="6"}-->	<cr>
							\<!--/content--> <cr>
							\<!--/list-->

				"mysql
					ab myh  
							\/*!40101 SET @saved_cs_client     = @@character_set_client */; <cr>
							\/*!40101 SET character_set_client = utf8 */;
					ab mye 
							\/*!40101 SET character_set_client = @saved_cs_client */;

				" bash head 
                    ab bh 
                        \#!/bin/bash <cr>
                        \# Description:  this program is  <cr>
                        \# Editor:       zhangshijie <cr> 
                        \# Email:        406358964@qq.com <cr>
                        \# Version:      1.0 <cr>
                        \# History:      <F6> creat
						\# Date:   　　　call append(line(".")+3,"*    Date        : ".strftime("%Y.%m.%d"))

				" JamesKid head
					ab jameskid 
						\" ================================JamesKid============================== <cr>
						\" @author		: JamesKid  <cr>
						\" @description :<cr>
						\" @change		:<cr>
						\" ======================================================================
				" php file
					:inoremap phh <?php?><ESC>hi<cr><cr><ESC>ki
				" php test
					:inoremap ect echo<space>"ok";die;
					" time test
						ab btime $beginTime=microtime(true);
						ab etime $endTime=microtime(true);<cr>$useTime=$endTime-$beginTime;<cr>echo $useTime;
					" memory test
						ab bmemory $beginMemory = memory_get_usage();
						ab ememory echo "<br />";<cr>$endMemory = memory_get_usage();<cr>$useMemory = $endMemory - $beginMemory;<cr>echo $useMemory;
		
" other
		" weiBo  
			let g:weibo_access_token='C1DC586CEA8332614E8C2687730FD55B'
	
" source 
		" source function
			"source E:\work_zhang\work\5_soft\4.vim\7_my_vim_function\1_common.vim	" my first function
		" function here
				" zip all line to one line 
					imap ;m <c-r>=line('$')<S-J>
				" get time
					"imap ;v <c-r>=strftime('%c')<cr>
					imap ;v <c-r>=strftime('%Y-%m-%d')<cr>
				" add my comment function
					autocmd BufNewFile *.zsj,*.jam exec ":call SetComment()"
					func SetComment()
						call setline(1,"/*===============================================================")
						call append(line("."),"*  ") 
						call append(line(".")+1,"*    File Name   : ".expand("%:t")) 
						call append(line(".")+2,"*    Author      : JamesKid")
						call append(line(".")+3,"*    Date        : ".strftime("%Y.%m.%d")) 
						call append(line(".")+4,"*    Description : ") 
						call append(line(".")+5,"*    Update Log  : ") 
						call append(line(".")+6,"*    Tencent.co") 
						call append(line(".")+7,"================================================================*/") 
					endfunc
				" use ctrl+ + and ctrl+ - to contrl font-size
					nnoremap <C-kplus>	:call IncFontSize(+1)<CR>
					nnoremap <C-kMinus>	:call IncFontSize(-1)<CR>
					nnoremap <C-k0>	    :call IncFontSize(0)<CR>
					fun! IncFontSize(inc)
						if !exists('+guifont')
							return
						endif
						let s:defaultfont =' Ubuntu Mono 12'
						if a:inc==0 || empty(&guifont)
							let &guifont = s:defaultfont
							return
						endif			
						lef &guifont = substitute (&guifont, '\d\+$', '\=submatch(0)+'.a:inc, '')
					endfun
					" function2　
						let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
						let s:minfontsize = 6
						let s:maxfontsize = 16

						function! AdjustFontSize(amount)
							if has("gui_gtk2") && has("gui_running")
								let fontname = substitute(&guifont, s:pattern, '\1', '')
								let cursize = substitute(&guifont, s:pattern, '\2', '')
								if (cursize < s:minfontsize) || (cursize > s:maxfontsize)
									let cursize = 10
								endif
								let newsize = cursize + a:amount
								if (a:amount > 1) 
									let newsize = a:amount
								endif
								if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
									let newfont = fontname . " " . newsize
									let &guifont = newfont
								endif
							else
								echoerr "You need to run the GTK2 version of Vim to use this function."
							endif
						endfunction 

						map <C-Up> :call AdjustFontSize(1) <CR>
						map <C-Down> :call AdjustFontSize(-1) <CR>
						map <C-Home> :call AdjustFontSize(10) <CR> 

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
				" shortcut to open Nerdtree and taglist
				nmap <silent> ;j :WMToggle<cr>
				nmap <silent> ;l :TlistToggle<cr>
				"在进入vim时自动打开winmanager

				let g:AutoOpenWinManager = 1

		" ctags 	
				"生成一个tags文件
				nmap <f9> <esc>:!ctags -r *<cr>

		" taglist	
				" 这项必须设定，否则出错,配置taglist的ctags路径
				"let Tlist_Ctags_Cmd = 'D:\ctags58\ctags.exe'
				" you can use 'yum install ctags' to install it in linux
				let Tlist_Ctags_Cmd = '/usr/bin/ctags'

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
				"let Tlist_Auto_Open=1
		" cscope
				"cs a E:\work_zhang\work\14_work\web\2_company_zhong\2_dynamic_web\canphp\cscope.out

		" txtBrowser
				" config
					syntax on
					filetype plugin on
					au BufEnter *.txt setlocal ft=txt
					let TxtBrowser_Dict_Url='http://dict.cn/text'
				" use note 
					" \g      : go the the website under the cursur
					" \f	  : find the meaning of the word in the dictionary
					" \s	  : search the word under the cursor
					" \h	  : heightlight the word under the cursor

		" NERDTree
				"let NERDTRee_Auto_Open=1
		
		" miniBufExpl
				"let g:miniBufExplMapWindowNavVim = 1
				"let g:miniBufExplMapWindowNavArrows = 1
				"let g:miniBufExplMapCTabSwitchBufs = 1
				"let g:miniBufExplMSelTarget = 1
				"let g:miniBufExplMoreThanOne = 0

		" bufexplorer
		" rainbrow 
			"let g:rainbow_active = 1
			"let g:rainbow_operators = 2
		" easy motion
			" use tips 
				" \\w    :find word
				" \\f	 :find letter 
		" emmet
			" git path 
				" git clone https://github.com/mattn/emmet-vim.git
			" use tips 
				" input 'div>ul>li*5' then press ctrl+y then press ,
			" config
				" change key 
					" let g:user_emmet_leader_key='<c-p>'
				" enable in different mode
					" let g:user_emmet_mode='n'    " only enable normal mode
					" let g:user_emmet_mode='inv'  " enable all mode
					" let g:user_emmet_mode='a'    " enable all mod
				" enable just for html/css
					" let g:user_emmet_install_global = 0
					" autocmd FileType html,css EmmetInstall
			" help
				" https://raw.github.com/mattn/emmet-vim/master/TUTORIAL

		" look up file
			
			let g:LookupFile_TagExpr = '"./filenametags"' 	" 设定filenametags
			let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
			" let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
			let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
			let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
			let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
			if filereadable("./filenametags")                "设置tag文件的名字
				let g:LookupFile_TagExpr = '"./filenametags"'
			endif
			"映射LookupFile为,lk
			nmap <silent> <leader>lk :LUTags<cr>
			""映射LUBufs为,ll
			nmap <silent> <leader>ll :LUBufs<cr>
			"映射LUWalk为,lw
			nmap <silent> <leader>lw :LUWalk<cr>
			" help 
				" http://easwy.com/blog/archives/advanced-vim-skills-lookupfile-plugin/
			" create filenametags
				"create filenametags file and put this file to /vim74/ and run it 

				"#!/bin/sh
				"# generate tag file for lookupfile plugin
				"echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
				"find . -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
				"sort -f >> filenametags 
			 

" file auto control 
		" html
			" autocmd Bufread *.html 	 normal! gg=G  <cr>
		" php
