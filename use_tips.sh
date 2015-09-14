#==============================================================
#!/bin/bash 
# Description:  this is some vim use tips here 
# Editor:       JamesKid 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2014-01-04_00_00 creat JamesKid
#               2014_01_18_17_43 add exec linux command
#==============================================================

# jump(跳转)
		# 跳到查找的词尾
				fk
# coding
	:set fenc=utf8  #1.transfer the file to utf-8

	:set fileencoding		# check the files encoding
	:set fileencoding=utf-8 # set the files encoding to utf-8

# regular expression
	:%s/href="[^"]\+=[^{css}]"/href="#"/g    # replace the href except xxxx.css"
# use linux or cmd command
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
	


