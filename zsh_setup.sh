sudo apt-get install powerline fonts-powerline -y

sudo apt-get install zsh-syntax-highlighting -y

echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo "source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" >~.zshrc
