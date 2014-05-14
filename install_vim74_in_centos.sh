#==================================================================
# Description:  this not is about install vim74 in centos6.5
# Editor:       JamesKid 
# Email:        406358964@qq.com 
# Version:      1.0 
#==================================================================
# install vimin centos
	yum install vim
	#or
	yum -y install vim-enhanced

# remove some part
	su - root
	yum remove vim vim-enhanced vim-common vim-minimal 
# get file and unzip
	wget ftp://ftp.vim.org/pub/vim/unix/vim-7
	wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2  
	wget ftp://ftp.vim.org/pub/vim/extra/vim-7.2-extra.tar.gz//网上的那个链接不能用  
	wget ftp://ftp.vim.org/pub/vim/extra/vim-7.2-lang.tar.gz

	tar jxvf vim-7.4.tar.bz2  
	tar zxvf vim-7.2-extra.tar.gz  
	tar zxvf vim-7.2-lang.tar.gz  
	  
	mv vim72 vim74
	yum install ncurses-devel
	yum install ncurses-dev
	yum install libncurses5-dev

# install
	cd vim74/src
	./configure --enable-multibyte --with-features=huge --disable-selinux
	make 
	make install
# test	
	vim --version	# if you can see the information meas you install it success
# path of the vimrc 
	/usr/local/share/vim/vimrc
# install ctags
	yum install ctags
# put plugin into it 

