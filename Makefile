install: install_bash

install_bash:
	ln -fs `pwd`/bash/.bashrc ~/.bash_profile
	ln -fs ~/.bash_profile ~/.bashrc
