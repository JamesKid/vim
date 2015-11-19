#==============================================================
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
#==============================================================

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
		
# jump(跳转)
		# 跳到查找的词尾
				fk
				;  # f{char} 查找后向下查找一个
				,  # f{char} 查找后向上查找一个
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
						:1,15 normal .  # 1到15行执行.重复
						:'<,'>normal .  # 对选中执行.重复
						:6t.  # 把第6行复制到当前行下方
						:t6   # 把当前行复制到第6行下方
						:t.   # 为当前行创建一个副本（类似于普通模式下的yyp）
						:t$   # 把当前行复制到文本结尾
						:'<,'>t0  # 把高亮选中的行复制到文件开头
						:%normal i//  # 注释整个js文件 *****
						:normal @q  # 应对复杂任务
 



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
	:r !command		# get the content result ,and print it in the current file
	:62,72 !sort	# sort the 62 to 72
	:24 w ! bash    # excute the code of line 19
	:. w !bash      # use the current file as command 
	:21 !bash		# it will excute line 21 and replace the lline 21
	:shell			# go to shell command line 
	ls -l

# edit network file
	:Nread scp://jameskid@192.168.72.129:33334//tmp/zsj.txt	 # read the zsj.txt
	:e scp://jameskid@192.168.72.129:33334//tmp/zsj.txt	 # edit the zsj.txt

# useful web 
	http://www.troyliu.com/20131114001.html # java ide2 making 
	

