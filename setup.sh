# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chown -R $(whoami) ~/.oh-my-zsh ~/.zshrc

# Install thefuck, zsh-suggestion
sudo python3 -m pip install thefuck
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Copy .zshrc file, setup z
cp .zshrc ~/.zshrc
touch ~/.z
