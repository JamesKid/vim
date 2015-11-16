#==============================================================
#!/bin/bash 
# Description:  this is some vim use tips here 
# Editor:       JamesKid 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2014-01-04_00_00 creat JamesKid
#               2014_01_18_17_43 add exec linux command
#               2015_11_16_17_00 add control(操作类) normal 按行执行
#==============================================================

# search(查找)
		*    # 查找当前光标下的单词
		/    # 正向查找
		?    # 反向查找
		
# jump(跳转)
		# 跳到查找的词尾
				fk
# control(操作类)
		#>G			# 让后面的所有行向右缩进
		5>>			# 让后面５行向右缩进
		~       # 将小写转大写,大写转小写
		>Gj.j.  # 让后面的行层叠缩进
		I       # 在行首输入
		A       # 在行尾输入
		A;<ESC>j.j. # 在行尾添加分号并向下重复
		A;<ESC>v选中要更改的行:'<,'>normal .  # 向选中的每一行执行同样操作
						# :'<,'>normal . 解读为"对高亮先区中的每一行,对其执行 .命令
		:%normal A; # 全文行后加;
		:24,30 normal A; # 24-30行执行 A;
		:24,30 normal .  # 24-30行执行重复操作
# 宏
		# 基本使用
			qa   # 将动作记录到寄存器a 
			@a   # 读取寄存器a 的动作
			3@a  # 执行3次a宏
		# 串行使用
				3@a  # 串行遇到问题时后面的行不执行
		# 并行使用
				:30,50 normal @a # 并行遇到问题继续执行
				
# codingk
	:set fenc=utf8  #1.transfer the file to utf-8
	:set fileencoding		# check the files encoding
	:set fileencoding=utf-8 # set the files encoding to utf-8

# regular expression(正则表达式)
	:%s/href="[^"]\+=[^{css}]"/href="#"/g    # replace the href except xxxx.css"
	

# use linux or cmd command;
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
	


