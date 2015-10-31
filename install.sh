echo "vim | start"

echo "vim | link vimrc"
ln -i ~/.dotfiles/vim/.vimrc ~/.vimrc
mkdir ~/.dotfiles/vim/bundle
mkdir ~/.dotfiles/vim/backupdir
mkdir ~/.dotfiles/vim/undodir

echo "vim | download vundle"
git clone https://github.com/gmarik/Vundle.vim.git ~/.dotfiles/vim/bundle/Vundle.vim

echo "vim | install plugin"
vim +PluginInstall +qall

echo "vim | end"

echo "tmux | start"
echo "tmux | SHOULD install tmux YOURSELF"
echo "tmux | just link tmux.conf"
ln -i ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "tmux | end"

echo "zsh | start"
echo "zsh | clone oh-my-zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | ZSH=~/.dotfiles/zsh/.oh-my-zsh sh

echo "zsh | link yeongjin.zsh-theme"
ln -i ~/.dotfiles/zsh/yeongjin.zsh-theme ~/.dotfiles/zsh/.oh-my-zsh/themes/yeongjin.zsh-theme

echo "zsh | link zshrc"
ln -i ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo "zsh | end"
