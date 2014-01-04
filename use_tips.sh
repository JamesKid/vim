#!/bin/bash 
# Description:  this is some vim use tips here 
# Editor:       JamesKid 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2014-01-04 creat JamesKid

# coding
	:set fenc=utf8  #1.transfer the file to utf-8

# regular expression
	:%s/href="[^"]\+=[^{css}]"/href="#"/g    # replace the href except xxxx.css"
