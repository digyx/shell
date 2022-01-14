# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chown -R $(whoami) $HOME/.oh-my-zsh $HOME/.zshrc

# Install thefuck, zsh-suggestion
sudo python3 -m pip install thefuck
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Copy dotfiles
ln -sn $PWD/.config $HOME/.config
ln -s $PWD/.zshrc $HOME/.zshrc
touch $HOME/.z

setup_macos() {
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
}

# Determine which OS is in use
case "$(uname)" in
    Linux*)   INSTALL_CMD="yay -S";;
    Darwin*)  INSTALL_CMD="brew install";;
esac

# Install software
$INSTALL_CMD git cloc htop
$INSTALL_CMD neovim
$INSTALL_CMD rustup rust-analyzer
$INSTALL_CMD go gopls
$INSTALL_CMD nodejs yarn

if [[ "$(uname)" == "Linux" ]]; then
    $INSTALL_CMD lxappearance
    $INSTALL_CMD adapta-gtk-theme papirus-icon-theme nerd-fonts-complete
    $INSTALL_CMD evince neofetch feh
    $INSTALL_CMD docker docker-compose
    $INSTALL_CMD texlive-full
fi
