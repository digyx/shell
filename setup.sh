# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chown -R $(whoami) ~/.oh-my-zsh ~/.zshrc

# Install thefuck, zsh-suggestion
sudo python3 -m pip install thefuck
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Copy dotfiles
cp .zshrc ~/.zshrc
touch ~/.z

mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

setup_macos() {
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
}

# Determine which OS is in use
case uname in
    Linux*)   INSTALL_CMD="yay -S";;
    Darwin*)  INSTALL_CMD="brew install";;
esac

# Install software
$INSTALL_CMD neovim
$INSTALL_CMD rustup rust-analyzer
$INSTALL_CMD go gopls
$INSTALL_CMD nodejs yarn
$INSTALL_CMD cloc

if [[ uname == "Linux" ]]; then
    $INSTALL_CMD wine-staging evince neofetch
    $INSTALL_CMD docker docker-compose
    $INSTALL_CMD texlive-full
elif [[ uname == "Darwin" ]]; then
    $INSTALL_CMD htop
