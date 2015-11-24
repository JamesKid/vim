#=========================VimKid=========================================
#!/bin/bash 
# Description:  this is some vimscript tips here 
# Editor:       JamesKid 
# Email:		    406358964@qq.com 
# Version:      1.0 
# History:      2015-11-24_9_30 creat vimscript 
#               2015_11_24_9_50 add debug web  and debug use
#==========================================================================

# best web( learn vimscript the hard way )
		# github 
				https://github.com/sjl/learnvimscriptthehardway/
		# web 
				http://learnvimscriptthehardway.onefloweroneworld.com/  # 中文教程地址
				http://learnvimscriptthehardway.stevelosh.com/  # 英文教程地址
# vimscript 
		# function

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


	
