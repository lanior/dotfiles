install: install_bash install_git

install_bash:
	ln -fs `pwd`/bash/.bashrc ~/.bash_profile
	ln -fs ~/.bash_profile ~/.bashrc

install_git:
	ln -fs `pwd`/git/.gitconfig ~/.gitconfig
	ln -fs `pwd`/git/.gitignore.global ~/.gitignore.global
