#==========================================================
#!/bin/bash 
# Description:  this is the note of vim problem
# Editor:       zhangshijie 
# Email:        406358964@qq.com 
# Version:      1.0 
# History:		2014_01_18_15_18 add problem
#==========================================================

# normal problem
	# can't uses ctrl+v in linux
		# find what use ctrl+v
		:verbose map <c-v>  

		you need to delete the 'mswin.vim' file in the $VIM directory 
		and comment the 
# plugin prolbem
	# nerdtree 
		# 1.在终端有时会目录树出现‘铝’乱码
			vim <~vim-path>/plugin/Nerdtree.vim
				call s:initVariable("g:NERDTreeDirArrows", !s:running_windows)
				# 把那个"!"去掉
