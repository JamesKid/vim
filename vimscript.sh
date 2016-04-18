#=========================VimKid=========================================
#!/bin/bash 
# Description:  this is some vimscript tips here 
# Editor:       JamesKid 
# Email:		    406358964@qq.com 
# Version:      1.0 
# History:      2015-11-24_9_30 creat vimscript 
#               2015_11_24_9_50 add debug web  and debug use
#               2015_11_26_9_50 add vimscript note
# book history  http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
#==========================================================================

# best web( learn vimscript the hard way )
		# github 
				https://github.com/sjl/learnvimscriptthehardway/
		# web 
				http://learnvimscriptthehardway.onefloweroneworld.com/  # 中文教程地址
				http://learnvimscriptthehardway.stevelosh.com/  # 英文教程地址
				http://blog.chinaunix.net/uid-24993824-id-160089.html  # 简短教程地址
				http://blog.csdn.net/smstong/article/details/20775695  # 详细教程地址
# vimscript 
		# basic
				:echo "Hello,world!"  # 在vim命令行输出hello,world
				:echom "Hello,world!"  # persistent echoing (持久输出)
				:messages   # see difference betyween these two commands
				#	to view it later function
				:set numberwidth=4    # set the numberwidth as 4 size 
				:set numberwidth?     # show the numberwidth 
				:help command # show the command help 
				
		# tips
				1. please use echom better than echo ,echom can let you run :messages 
				2. dont use comment after map (别在map后加注释)
				3. ignore mapping 
						:nmap x dd  
						:nnoremap \ x  # 当按下\ 时，取消x 的nmap
						vnoremap
						inoremap
						:help unmap # show map help



# debug 
		# learn  
				http://inlehmansterms.net/2014/10/31/debugging-vim/
		# use 
				vim --startuptime  vim.log # write startup info to a file vim.log
				debug CommandName  # debug a command
				debug call FunctionName(arg) # debug a function
		# debug mode
				vim -D somefile.txt  # enter debug mode
				cont  # continue execution until the next breakpoint (if one exists)
				quit  # stop current excution,but still stops at the next breakpoint
				step  # excute the current command and come back to debug mode wen it is finished
				next: # like step except it also steps over function calls and sourced files 
				interrupt # like quit,but returns to debug mode for the next command 
				finish  # finishes the current script or function and returns to debug mode for the next command
		    all of about can short as 'c,q,s,n,i,f'
				enter <cr> will excute the previous command again.
		# adding breakpoints
				breakadd func [lineNumber] functionName # add breakpoint to function
				breakadd file [lineNumber] fileName # add breakpoint to function
				breakadd here # add breakpoint to current line of current file
		# delete breakpoint
				breakdel number  # delete breakpoint number from breaklist output 
				breakdel *  # delete all breakpoints
				breakdel func [lineNumber] functionName  # delete breakpoint on function
				breakdel file [lineNumber] fileName  # delete breakpoint on file
				breakdel here # add breakpoint to current line of current file
		# debug with verbose
				set verbose=9  #set verbose command
				vim -V 9 file.text # set verbose on startup 
				 >= 1  # When the viminfo file is read or written.
				 >= 2  # when a file is ":source"'ed.
				 >= 5  # Every searched tags file and include file.
				 >= 8  # Files for which a group of autocommands is executed.
				 >= 9  # Every executed autocommand.
				 >= 12 # Every executed function.
				 >= 13 # When an exception is thrown, caught, finished, or discarded.
				 >= 14 # Anything pending in a ":finally" clause.
				 >= 15 # Every executed Ex command (truncated at 200 characters).
				 set verbosefile=filename.txt
				 :12 verbose call MyFunction()

# compare (比较)
		 "=~" 为匹配正则表达式,详细介绍如下表:  
		                使用 "ignorecase"    匹配大小写        忽略大小写 ~  
		 等于                   "=="            "==#"         "==?"  
		 不等于                 "!="            "!=#"           "!=?"  
		 大于                   ">"             ">#"            ">?"  
		 大于等于               ">="            ">=#"           ">=?"  
		 小于                   "<"             "<#"            "<?"  
		 小于等于               "<="            "<=#"           "<=?"  
		 匹配正规表达式         "=~"            "=~#"           "=~?"  
		 不匹配正规表达式       "!~"            "!~#"           "!~?"  
		 相同实例               "is"  
		 不同实例               "isnot"  
# function (常用方法) 
		# tips (调试方式)
				:echo hostname()   # 输出hostname, :call hostname()为静默调用,不输出
		# option

				#字符串操作：
						char2nr()   # 得到一个字符的ASCII码值
						nr2char()   # 得到一个ASCII值对应的字符
						escape()    # 返回一个字符串以\转义符表达式的形式
						strtrans()  # 将一个字符串转换为可显示形式[[译注: 如将ASCII为9的TAB键字符显示为^I]
						tolower()   # 将一个字符串转换为小写
						toupper()   # 将一个字符串转换为大写
						match()			# 返回一个搜索在一个字符串中出现的位置
						matchend()  # 同match(), 但从后往前搜索
						matchstr()  # 同match, 但返回匹配到的目标串
						stridx()    # 一个子串初次出现在母串中的位置
						strridx()   # 一个子串最后一次出现在母串中的位置
						strlen()    # 求字符串长度.
						substitute()    # 字符串替换
						submatch()  # 得到一次":substitute"操作中的匹配到的一个子模式[[译者: 指用\(\)括起
						strpart()   # 得到一个字符串的子串
						expand()    # 扩展特殊的关键字
						type()      # 变量的类型, 返回0为数字, 1为字符串[[译者: 注意其参数要求是变量名没错
						iconv()			# 转变文字编码

				# 当前缓冲区操作:
						byte2line() # 得到该文件中第N个字节位于第几行
						line2byte() # 同上面的相反, 求得指定行的首字符位于文件中的字节偏移
						col()       # 得到光标或一个mark所在的列号
						virtcol()   # 得到光标或一个mark所在屏幕上的列位置
						line()      # 得到光标或一个mark所在的行号
						wincol()    # 当前光标在当前窗口坐标中的列号
						winline()   # 当前光标在当前窗口坐标中的行号
						cursor()    # 将光标置于指定的行列
						getline()   # 从当前缓冲区中得到指定行的内容
						setline()   # 将缓冲区某行的内容替换为指定内容
						append()    # 将参数中指定的字串附加在指定行的下面
						indent()    # 得到指定行的缩进量
						cindent()   # indent according to C indenting
						lispindent()   #  indent according to Lisp indenting
						nextnonblank() # 返回指定行及指定行之后的第一个非空行
						prevnonblank() # 返回指定行及指定行之前的第一个非空行
						search()     # 查找下一个正则表达式
						searchpair() # find the other end of a start/skip/end

				#系统函数和文件操作:
						browse()     # 打开一个文件对话框请求指定一个文件
						glob()      # 扩展文件名通配符
						globpath()  # 同上, 但可以指定一系列的目录
						resolve()   # 返回MS-Windows上一个链接所指向的目标
						fnamemodify()   # 返回文件名的各种形式
						executable()    # 检查一个可执行程序是否存在
						filereadable() # 检查文件的可读性
						filewritable() # 检查文件是否可写
						isdirectory()   #  检查一个目录是否存在
						getcwd()     # 返回当前工作目录
						getfsize()   # 得到指定文件的大小
						getftime()    #  得到指定文件的最后修改时间
						localtime()  # 获取当前时间
						strftime()   # 将时间转换为字符串形式
						tempname()   # 得到一个临时文件名
						delete()     # 删除文件
						rename()     # 文件更名
						system()     # 执行一个SHELL命令
						hostname()   # 当前系统的主机名 缓冲区, 窗口和参数列表:
						argc()       # 返回参数列表中的参数个数
						argidx()     # 参数列表中的当前索引号
						argv()       # 返回参数列表中指定索引号的参数
						bufexists()  # 检查一个缓冲区是否存在
						buflisted()  # 检查一个缓冲区是否存在并且位于缓冲区列表中
						bufloaded()  # 检查一个缓冲区是否存在并被载入
						bufname()    # 返回指定缓冲区号所对应的缓冲区名字
						bufnr()			 # 返回指定缓冲区名字所对应的缓冲区号
						winnr()      # 返回当前窗口的窗口号
						bufwinnr()   # 得到指定缓冲区所在的窗口号, 没有对应窗口时返回
						winbufnr()   # 返回指定窗口中所编辑的缓冲区的号码
						getbufvar()  # 得到指定缓冲中的一个变量
						setbufvar()  # 为指定缓冲区设定变量值
						getwinvar()  # 得到指定窗口的变量
						setwinvar()  # 为指定窗口设置变量

				#折行:
						foldclosed()    # 检查指定行是否位于一个处于关闭状态的折行内, 若是返回该折行的首行行号, 否非, 返回-1
						foldclosedend() # 同上, 返回的是折行的尾行行号
						foldlevel()     # 返回指定行的折行层级, 没有定义折行时返回0
						foldtext()      # 生成一个关闭的折行所显示的文本[[

				#语法高亮:
						hlexists()     # 检查一个语法高亮项是否存在
						hlID()         # 返回一个语法高亮项的ID
						synID()			   # 返回指定位置的语法ID
						synIDattr()	   # 返回某语法ID的指定属性
						synIDtrans()   # 得到某语法项最终应用了其颜色定义的那种语法的ID

				#历史列表:
						histadd()   # 向历史列表中加入条目
						histdel()   # 从历史列表中删除条目
						histget()   # 从历史列表中得到一个条目
						histnr()    # 得到历史列表中记录个数

				#交互操作:
						confirm()           # 让用户确认一组选择
						getchar()           # 请用户输入一个字符
						getcharmod()    # get modifiers for the last typed character
						input()         # 从用户那要一行内容
						inputsecret()   # 同上, 但不回显输入的内容
						inputdialog()   # 让用户在一个对话框里输入
						inputresave			# save and clear typeahead
						inputrestore()  # restore typeahead

				#Vim服务器:
						serverlist()        # 返回服务器名字列表
						remote_send()       # 向指定服务器发送命令字符
						remote_expr()       # 在服务器求值一个表达式
						server2client()     # 向客户端发送一个回应
						remote_peek()       # 检查是否收到来自服务器的回应
						remote_read()       # 从服务器读取回应信息
						foreground()        # 将Vim窗口移到前台
						remote_foreground() # 将Vim服务器窗口移至前台

				#其它:
						mode()          # 返回当前的编辑模式
						visualmode()    # 返回最近一次使用的Visual子模式
						hasmapto()      # 检查是否有一个键被定义为指定的内容
						mapcheck()      # 检查一个映射是否存在
						maparg()        # 返回一个映射的右部, 即它所被映射的内容
						exists()        # 检查一个变量或函数等是否被定义
						has()           # 检查当前的Vim是否支持某个特性
						cscope_connection()  # 检查是否存在某个cscope连接
						did_filetype()  # 检查是否一个设置文件类型的自动命令已被执行过
						eventhandler()  # 检查当前脚本是否因事件触发而被调用
						getwinposx()    # 返回窗口的X坐标, 单位为象素
						getwinposy()    # 返回窗口的Y坐标, 单位为象素
						winheight()     # 返回指定窗口的高度, 单位为字符
						winwidth()      # 返回指定窗口的宽度, 单位为字符
						libcall()       # 调用外部共享库中的一个函数
						libcallnr()     # 同上, 但用于返回int的函数







	
