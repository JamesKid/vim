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
