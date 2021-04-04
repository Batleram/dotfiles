#/bin/bash

currentDir=$(pwd)

rm -rf ~/.zshrc 
rm -rf ~/.bashrc 
rm -rf ~/.fonts 
rm -rf ~/.fonts.conf 
rm -rf ~/.p10k.zsh 
rm -rf ~/.oh-my-zsh
rm -rf ~/.config/nvim
rm -rf ~/.config/coc 
rm -rf ~/.config/kitty

ln -sf $currentDir/.zshrc ~/.zshrc
ln -sf $currentDir/.bashrc ~/.bashrc
ln -sf $currentDir/.fonts ~/.fonts
ln -sf $currentDir/.fonts.conf ~/.fonts.conf
ln -sf $currentDir/.p10k.zsh ~/.p10k.zsh
ln -sf $currentDir/.oh-my-zsh ~/.oh-my-zsh


ln -sf $currentDir/.config/nvim ~/.config/nvim
ln -sf $currentDir/.config/coc ~/.config/coc
ln -sf $currentDir/.config/kitty ~/.config/kitty
