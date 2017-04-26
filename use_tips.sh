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
#               2016_1_21_15_17  add 'q:' 浏览命令历史 'q/' 浏览搜索历史 ******
#               2017_2_6_18_17   add vim8 安装
#               2017_4_26_19_21  add vim加密文件
#==========================================================================

# install 
    # vim8 (centos)
        wget https://github.com/vim/vim/archive/master.zip
        unzip master.zip
        cd vim-master/src
        ./configure
        make && make install

# best web( learn vimscript the hard way )
		# github 
				https://github.com/sjl/learnvimscriptthehardway/
		# web 
				http://learnvimscriptthehardway.onefloweroneworld.com/  # 中文教程地址
				http://learnvimscriptthehardway.stevelosh.com/  # 英文教程地址
# debug 
		 http://inlehmansterms.net/2014/10/31/debugging-vim/

# history (历史查找)
		q:   # 查找命令行输入历史 ******
		q/   # 查找/查找历史      ******
		
# search(查找)
		*    # 查找当前光标下的单词
		/    # 正向查找
		?    # 反向查找
		\c   # 忽略大小写  如 /test\c
		\C   # 强制大小写  如 /test\C
		set nohlsearch # 禁用高亮
		/search<esc>  # 返回原光标处 ***
		:%s/search//gn # 统计匹配个数
		/search/e      # 查找焦点定位到词尾

# substitute (替换)replace
		# (flag)标志位
				g  # 修改一行内的所有匹配,而不仅仅是第一处匹配 
				c  # 确认是否拒绝每一处修改
				n  # 抵制正常的替换行为
		# 符号
				\r  # 插入一个换行符
				\t  # 插入一个制表符
				\\  # 插入一个反斜杠
				\1  # 插入第1个子匹配
				\2  # 插入第2个子匹配（以此类推，最多到\9）
				\0  # 插入匹配模式的所有内容
				&   # 插入匹配模式的所有内容
				~   # 使用上一次调用:substitute时的{string}
				\={Vim script} # 执行{Vim Script}表达式；并将返回的结果作为替换{string}
		# c 替换提示
				y  # 替换此处匹配
				n  # 忽略此处匹配
				q  # 退出替换过程
				l  # “last”—— 替换此处匹配后退出
				a  # “all”—— 替换此处与之后所有的匹配
				<C-e>  # 向上滚动屏幕
				<C-y>  # 向下滚动屏幕
		# 用寄存器里的内容替换
				:%s//<C-r>0/g 
		# 交换字段顺序
				# last name,first name,email 
				# neil,drew,drew@vimcasts.org 
				# doe,john,john@example.com 
				/\v^([^,]*),([^,]*),([^,]*)$ 
				:%s//\3,\2,\1 
		# Abolish.vim  超级substitute命令
				# 方便交换功能
						:%S/{man,dog}/{dog,man}/g
		# 删除所有匹配行
				:g/re/d  # 删除匹配行
				:v/re/d  # 只保留匹配行

 
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
						q:      # 查看历史ex命令 按 <CR>会执行******
										# 可在里面编辑，合并命令成 xxx | xxx
						q/      # 打开查找命令历史的命令行窗口 ******
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
						I<C-r>=i<cr><esc>  # 插入变量i的值
						# 相关强大的替换介绍网站
						# http://www.cnblogs.com/simonshi/archive/2012/02/13/2350091.html
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

		# 编辑宏
		# 对一组文件使用宏


# autoload(自动加载)
    # example
        autocmd Bufread * :VimkidGetTips   # 读取Bufread时执行VimkidGetTips方法
        autocmd FileType php nnoremap <leader>c I//<esc>     # 添加单行注释

    # type
        Bufread  # 读取文件时

				
# coding(编码)
		:set fenc=utf8  #1.transfer the file to utf-8
		:set fileencoding		# check the files encoding
		:set fileencoding=utf-8 # set the files encoding to utf-8

# regular expression(正则表达式)
		:%s/href="[^"]\+=[^{css}]"/href="#"/g    # replace the href except xxxx.css"
		/#\([0-9a-fA-F]\{6}\|[0-9a-fA-F]\{3}\)  # 匹配css颜色 #ff0000
		/\v#([0-9a-fA-F]{6}|[0-9a-fA-F]{3})     # 同上 加\v 参数不用转义
		\x     # 代表完整字符集[0-9a-fA-F]
		/\v#(\x{6}|\x{3})   # 匹配css颜色
		/\Va.k.a<cr>       # 打开原义开关,只匹配a.k.a
		# 子匹配
		/\v<(\w+)\_s+\1>  # 匹配重复单词 abc abc abc
		\_s    # 匹配空字符和换行符
		/\v<the>   # 单个单词完整匹配
		\zs    # 匹配前缀元 start
		\ze    # 匹配后缀元 end
		/Pracical \zsVim  # 查找前面为Pratical的Vim
		/\v"[^"]+"<CR>    # " # 匹配双引号含引号
		/\v"\zs[^"]+\ze"<CR>    # " # 匹配双引号不含引号
		/\Vhttp://www.baidu.com
		?www.baidu.com   # 反向不转义
		[^']   "# 排除单引号
		/\v'[^']+'   #匹配单引号
		/\v'([^']|'\w)+' # 排除类似 don't


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
    :X          # 对文件加密 *****
    ggvGJ       # 合并所有行
    %s/\/\/.*//g # 替换所有// 注释为空
    :%s!\s*/\*\_.\{-}\*/\s*! !g   # 替换所有 /* */ 注释为空


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
						ds"      # 删除引号"
						ysiw]    # 添加中括号
						ysiw<pm> # 添加p标签

						
# vimscript
    # functions
        # execute
            :execute "write"   # 执行write 命令
            :execute "normal! gg"  # normal模式下执行gg 命令
            :execute "normal! gg/er\<cr>"  # 查找er
        # normal
            :normal! G  # Vim将移动光标到文件底部，即使G已经被映射了。****
            # 在写Vim脚本时，你应该总是使用normal!，永不使用normal。不要信任用户在~/.vimrc中的映射。
        # add  (添加数组元素)
            :let foo = ['a']
            :call add(foo, 'b')
            :echo foo  # 输出['a','b']
        # len  (显示数组元素个数或字符串长度)
        # reverse (反转数组元素)
            
            
            


    # if 语句
        :if 1
        :    echom "ONE"
        :endik

    # elseif
        :if 0
        :    echom "if"
        :elseif "nope!"
        :    echom "elseif"
        :else
        :    echom "finally!"
        :endif

    # for循环
        :let c = 0
        :for i in [1, 2, 3, 4]
        :  let c += i
        :endfor
        :echom c

    # while循环
        :let c = 1
        :let total = 0
        :while c <= 4
        :  let total += c
        :  let c += 1
        :endwhile
        :echom total

    # compare(比较)
        >    # 大于
        <    # 小于
        ==   # 等于,是否大小写敏感根据set不同
        ==?  # 无论你怎么设都大小写不敏感
        ==#  # 无论你怎么设都大小写敏感

    # function(方法)
        # tips
            1.方法要大写开头

            2. 注意作用域
                :function DisplayName(name)
                :  echom "Hello!  My name is:"
                :  echom a:name
                :endfunction
                :call DisplayName("Your Name")
            3. 不定数量的参数
                :function Varg(...)
                :  echom a:0
                :  echom a:1
                :  echo a:000
                :endfunction
                :call Varg("a", "b")
            4. 变量重新赋值
                :function AssignGood(foo)
                :  let foo_tmp = a:foo
                :  let foo_tmp = "Yep"
                :  echom foo_tmp
                :endfunction
                :call AssignGood("test")
            
        # use 
            :call Meow()      # 执行方法,不显示返回值
            :echom GetMeow()  # 调用GetMeow并把返回值传递给echom。
    # 字符串 
        # 连接
            :echom "Hello, " . "world"
        # 避免特殊符号被转义
            :echom '\n\\'   # 用echom 且加单引号

    # 字符串函数
        :echom strlen("foo")  # 获取字符串长度返回3 
        :echom len("foo")     # 获取字符串长度返回3 
        :echo split("one two three") # 显示['one','two','three']注意是echo而不是echom
        :echo split("one,two,three", ",")  # 同上
        :echo join(["foo", "bar"], "...")  # 显示foo...bar
        :echo join(split("foo bar"), ";")  # foo;bar
        :echom tolower("Foo")    # 显示foo
        :echom toupper("Foo")    # 显示FOO


    # 作用域
        # description
            在VimScript中默认的作用域是全局作用域，也就是说你在一个脚本文件中定义了一个变量，在其他脚本中也可以读取和修改这个变量。在任何编程语言中，全局变量的滥用都会造成混乱，所以VimScript提供了更多的非全局作用域。

        # detail
            s:name 脚本文件作用域，此时s:name这个变量只在当前脚本文件中有效，其他的脚本文件中如果也定义了同名的s:name也没关系，因为这两者彼此独立。这一点与C中的static关键字类似。
            b:name 缓冲区作用域，b:name只在指定的缓冲区中有效
            w:name 窗口作用域，w:name只在指定的窗口中有效
            g:name 全局作用域，函数外定义的变量的默认值
            v:name vim预定义的变量，注意预定义变量不同于vim的选项(option)变量。
            l:name 函数内部的局部变量，函数内部定义的变量的默认值

    # var(变量)
        # 环境变量  
            echo $HOME  
            echo $VIM  
            echo $VIMRUNTIME  
            echo $notexist  
            echo type($HOME)  
            echo type($notexist)  
                
        # 普通变量
            :let @a = "hello!"  # 将hello存到寄存器@a中
            :echo @a  # 输出@a寄存器内容
        

                
            

      





