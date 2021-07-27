#/bin/bash

currentDir=$(pwd)

rm -rf ~/.zshrc 
rm -rf ~/.bashrc 
rm -rf ~/.fonts 
rm -rf ~/.fonts.conf 
rm -rf ~/.p10k.zsh 
rm -rf ~/.oh-my-zsh
rm -rf ~/.oh-my-bash
rm -rf ~/.config/nvim
rm -rf ~/.config/coc 
rm -rf ~/.config/kitty
rm -rf ~/.conky

ln -sf $currentDir/.zshrc ~/.zshrc
ln -sf $currentDir/.bashrc ~/.bashrc
ln -sf $currentDir/.fonts ~/.fonts
ln -sf $currentDir/.fonts.conf ~/.fonts.conf
ln -sf $currentDir/.p10k.zsh ~/.p10k.zsh
ln -sf $currentDir/.oh-my-bash ~/.oh-my-bash
ln -sf $currentDir/.oh-my-zsh ~/.oh-my-zsh
# install zsh stuff
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


mkdir ~/.config
ln -sf $currentDir/.config/nvim ~/.config/nvim
ln -sf $currentDir/.config/coc ~/.config/coc
ln -sf $currentDir/.config/kitty ~/.config/kitty
ln -sf $currentDir/.conky ~/.conky
