#==========================================================================
#!/bin/bash 
# Description:  this is some vim use tips here 
# Editor:       JamesKid 
# Email:		    406358964@qq.com 
# Version:      1.0 
# History:      2014-01-04_00_00 creat JamesKid
#               2014_01_18_17_43 add exec linux command
#               2015_11_16_17_00 add control(操作类) normal 按行执行
#               2015_11_19_17_00 add 特殊字符,数字运算
#               2015_11_19_18_00 add Ex命令格式
#               2015_11_20_15_27 add 用shell命令对文本排序
#               2015_11_20_17_27 add 文件打开相关
#               2015_11_23_15_17 add learn vimscript the hard way  web
#               2015_11_23_15_17 add vim debug tool
#               2015_12_21_15_17 add vim move
#==========================================================================

# best web( learn vimscript the hard way )
		# github 
				https://github.com/sjl/learnvimscriptthehardway/
		# web 
				http://learnvimscriptthehardway.onefloweroneworld.com/  # 中文教程地址
				http://learnvimscriptthehardway.stevelosh.com/  # 英文教程地址
# debug 
		 http://inlehmansterms.net/2014/10/31/debugging-vim/
# search(查找)
		*    # 查找当前光标下的单词
		/    # 正向查找
		?    # 反向查找
# count(运算)	
		<C-a>  # 对数据执行加操作 如果光标不在数字上会正向跳到所找到的第一个数字上
		<C-x>  # 对数据执行减操作
		5<C-x>  # 对数据执行减5操作
		# tips
				# 如果想将007,08,这些零开头的数字也加1那么在配置加下面这句
						set nrformats=
		gU   # 转换一行为大写
		gUaw # 转换当前单词成大写
		gUgU # 当前行变成大写
		
# jump(跳转,移动)
		# 跳到查找的词尾
				fk
				;  # f{char} 查找后向下查找一个，当前行
				,  # f{char} 查找后向上查找一个,当前行
				F{char} # 查找后向上查找一个,当前行
				T{char} # 查找后向上查找位于前一个,当前行
				t{char} # 查找后向上查找位于前一个一个,当前行
				gk # 向上移动一个屏幕行
				0    # 移动到行首
				^    # 移动到非空白行首
				<leader><leader>j # 向上查找路转行，已经map成',j' ******
				<leader><leader>k # 向上查找路转行，已经map成',k' ******
# mark  (添加标记)
		m{a-zA-Z} # 添加标记
		# `{a-zA-Z} # 跳转到标记
		`` # 当前文件中上次跳转动作之前的位置
		`. # 上次修改的地方
		`^ # 上次插入的地方
		`[ # 上次修改或复制的起始位置
		`] # 上次修改或复制的结束位置
		`< # 上次高亮选区的起始位置
		`> # 上次高亮选区的结束位置
		
# control(操作类)
		# 普通模式
			# 基本操作符
					c		 #修改
					d    #删除
					y		 #复制到寄存器
					g~　 # 反转大小写
					gu　 # 转为小写 
					gU　 # 转为大写
					>    # 增加缩进
					<    # 减少缩进
					=	   # 自动缩进

			# 复合操作
				#>G			# 让后面的所有行向右缩进
				5>>			# 让后面５行向右缩进
				~       # 将小写转大写,大写转小写
				>gj.j.  # 让后面的行层叠缩进
				I       # 在行首输入
				A       # 在行尾输入
				A;<ESC>j.j. # 在行尾添加分号并向下重复
				A;<ESC>v选中要更改的行:'<,'>normal .  # 向选中的每一行执行同样操作
								# :'<,'>normal . 解读为"对高亮先区中的每一行,对其执行 .命令
				:%normal A; # 全文行后加;
				:24,30 normal a; # 24-30行执行 a;  *****
				:24,30 normal .  # 24-30行执行重复操作 *****
				d3w     # 删除3个词
				vap  # 选中整个段落
				dap  # 删除整个段落
			# 插入模式
					# 删除操作
						<C-h> #删除前一个字符(同退格键)
						<C-w> #删除前一个单词 *****
						<C-u> #删除到行首 *****
					# 非常用字符输入 (代号查unicode表)
							<C-v>{code}  # 格式
							<C-v>065     # 插入代号为65的字符 
							ga           # 查看光标上字符的代号
							<C-v>{123}   # 以十进制插入
							<C-v>u{1234}   # 以十六进制插入
							<C-v>{nondigit}   # 按原义插入非数字字符
							<C-k>{char1}{char2}   # 插入以二合字母{char1}{char2}表示的字符
							<C-k>?I      # 输出¿ 反问号 ,<<输出左书名号
							<C-k>12      # 输出2分之一 ½
							:digraphs    # 查看特殊字符二合字母列表
		  # 虚拟替换模式
					gR  # 在有制表符时当成8个字符处理
		  # 可视模式
				  # 通用
							V   # 行可视模式 *****
							gv  # 重选上次的高亮选区**
							o   # 切换其活动的端点
							e   # 向后一个词推选选区 *****
							yypVr- # 将一行字符全部替换成-
				  # 列块可视模式
							o  # 切换选择方向
			# 命令行模式(其中执行的命令也叫ex命令)
				  # 命令格式 ******
						:[range]delete [x]   # 删除指定范围内的行[到寄存器x中]
						:[range]print   # 打印指字范围
						:[range]yank [x]  # 复制指定范围的行[到寄存器x中]
						:[line]put [x]  #在指定行后粘贴寄存器x中的内容
						:[range]copy {address}  #把指定范围内的行拷贝到{address} 所指定的行之下
						:[range]move {address}  #把指定范围内的行移动到{address}所指定的行之下
						:[range]join  #连接指定范围内的行
						:[range]normal {commands}  #对指定范围内的每一行执行普通模式命令{commands}
						:[range]substitute/{pattern}/{string}/[flags] #把指定范围内出现{pattern}的地方替换为{string}
						:[range]global/{pattern}/[cmd]  #对指定范围内匹配{pattern}的所有行，在其上执行 Ex 命令{cmd} 
						:t      # :copy的简写
						:m      # :move的简写
				  # range
						:1,3                  # 对1到3行进行处理
						:/<html>/,/<\/html>/p # 打印html范围内的内容 *****
						:/<html>/+1,/<\/html>/-1p # 向下偏移1行,向上偏移一行,打印html内的内容,缺省为1
						:{address}+n  # 行偏移格式 *****
				  
				  # 符号含义
						1  #文件的第一行
						$  #文件的最后一行
						0  #虚拟行，位于文件第一行上方
						.  #光标所在行
						'm  #包含位置标记m的行'
						'<  #高亮选区的起始行'
						'>  #高亮选区的结束行'
						%   # 整个文件（:1,$ 的简写形式）
				  # use 
						@:    # 重复上一次的ex命令 *****
						@@    # 重复@:
						:1,15 normal .  # 1到15行执行.重复
						:'<,'>normal .  # 对选中执行.重复
						:6t.  # 把第6行复制到当前行下方
						:t6   # 把当前行复制到第6行下方
						:t.   # 为当前行创建一个副本（类似于普通模式下的yyp）
						:t$   # 把当前行复制到文本结尾
						:'<,'>t0  # 把高亮选中的行复制到文件开头
						:%normal i//  # 注释整个js文件 *****
						:normal @q  # 应对复杂任务
						:bn   # 切换到下一缓冲区
						:bp   # 切换到上一缓冲区
						:col<C-d> # 显示可用的补全列表
						:<C-p>  # 调用上一个历史命令脱离up and down ******
						:<C-n>  # 调用下一个历史命令脱离up and down ******
						:<C-c>  # 返回普通模式 ******
						q:      # 查看历史ex命令 按 <CR>会执行**** 
										# 可在里面编辑，合并命令成 xxx | xxx
						q/      # 打开查找命令历史的命令行窗口
								# <C-p>和<C-n> 命令有个缺点，它们不会像<Up>和<Down>那样对历史命令进行过滤。 通过创建下面的自定义映射项，我们可以把二者的优点结合到一起：
								# cnormap <C-p> <Up> 
								# cnormap <C-n> <Down> 
						:ls     # 查看缓冲区的文件
						:bd     # 删除缓冲区文件
						:5,10bd # 删除５－１０编号缓冲区
						:args   # 查看vim *.txt 时打开的所有文件
						:args{arglist}  # {arglist}包括文件名，通配符,甚至是一条shell命令输出结果
						:args <tab>   #　切换打开当前目录下的文件,可跟通配符
						:args index.html index2.html # 分别打开index1 index2
						:args *.*  # 打开当前目录下的所有文件入缓冲区
						:args **/*.js # 打开当前目录及所有子孙目录里的js文件
						:args **/*.js **/*.css  # 打开当前目录及所有子孙目录里的js文件css文件
						:args `shell command`  # 可以将shell的输出结果作为args参数
						:n   # 切换到args的下一个文件
						:f   # 切换到args的上一个文件
						:wa  # 把所有改变的缓冲区写入磁盘
						:let i=0 | 1,30g/1/s//\=i/ | let i=i+2 # 每行执行加2操作 *******
						:let i=0  # 给变量赋值 |　分割语句 *******
						/s//\=i/  # 替换为i的函数式 *******
				# 窗口分割
						<C-w>s # 横向分割
						<C-w>v # 纵向分割
						<C-w>w  #在窗口间循环切换
						<C-w>h  #切换到左边的窗口
						<C-w>j  #切换到下边的窗口
						<C-w>k  #切换到上边的窗口
						<C-w>l  #切换到右边的窗口
						<C-w>c    #关闭活动窗口
						<C-w>o    #只保留活动窗口
						<C-w>=  # 使所有窗口等宽、等高
						<C-w>   # 最大化活动窗口的高度
						<C-w>|  # 最大化活动窗口的宽度
						[N]<C-w>_  #把活动窗口的高度设为[N ]行
						[N]<C-w>|  #把活动窗口的宽度设为[N ]列
						:clo    #关闭活动窗口
						:on    #只保留活动窗口
				# 标签
						:tabo  #  只保留活动标签页，关闭所有其他标签页
						{N}gt # 跳到指定编号的标签
				# 打开及保存文件
						:pwd  # 查看当前工作目录
						:e <tab><tab> #编辑工作目录下的文件
						gf    #　跳转到路径下的文件
				# :find 查找文件(会在配置的path中查找)
						# 配置 'path'选项
								:set path+=app/**   # ** 会通配app/下所有子目录
						# use 
								:f xxx<tab>  # 打开匹配文件
				# :write 
						:write !{cmd} #命令会把缓冲区的内容作为标准输入传给指定的{cmd}
						:!w !sudo tee % > /de/null
						:5,10 !>/tmp/test.txt  # 将５到１０行剪贴到/tmp/test.txt
 
# register (寄存器)
		<C-r>{register}			 # 一般格式
		<C-r><C-p>{register} # 更智能一些
		# 寄存器运算
		<C-r>=6*35<CR>       # 运算输出6*35  *****
		
# mocro(宏)
		# 基本使用
			  qa   # 将动作记录到寄存器a 
				@a   # 读取寄存器a 的动作
				3@a  # 执行3次a宏
		# 串行使用
				3@a  # 串行遇到问题时后面的行不执行
		# 并行使用
				:30,50 NORMAL @A # 并行遇到问题继续执行
				
# coding(编码)
	:set fenc=utf8  #1.transfer the file to utf-8
	:set fileencoding		# check the files encoding
	:set fileencoding=utf-8 # set the files encoding to utf-8

# regular expression(正则表达式)
	:%s/href="[^"]\+=[^{css}]"/href="#"/g    # replace the href except xxxx.css"
	

# use linux or cmd command(执行命令)
	:!command
	:!ls -l
	:r !command		# (输出到当前文件)get the content result ,and print it in the current file
	:62,72 !sort	# sort the 62 to 72
	:24 w ! bash    # excute the code of line 19
	:. w !bash      # use the current file as command 
	:21 !bash		# it will excute line 21 and replace the lline 21
	:shell			# go to shell command line 
	:!/bin/zsh  # 进入zsh 命令行
	ls -l
	ctrl+z      # 挂起当前vim
	jobs        #   # 查看当前的作业列表
	fg				  # 唤醒作业
	:2,50!sort -t ',' -k2 # 对第二列进行排序 ******
										    # cbd, debd
										    # cbd, aebd
										    # cbd, cebd
  !{motion}   # 对命令中的范围执行转入到命令模式
	!G          # 等同于：.,$!
	!3j         # 等同于:.,.+3! 


# edit network file
	:Nread scp://jameskid@192.168.72.129:33334//tmp/zsj.txt	 # read the zsj.txt
	:e scp://jameskid@192.168.72.129:33334//tmp/zsj.txt	 # edit the zsj.txt

# useful web 
	http://www.troyliu.com/20131114001.html # java ide2 making 

# plugin 
		# surround 
				#use 
						cs"'     # 将光标下的双引号替换成单引号如 "hello world"
						cs"<q>   # 将双引号替换为<q></q>标签
						ds"      # 删除引号
						ysiw]    # 添加中括号
						ysiw<pm> # 添加p标签

						

						
				

	

