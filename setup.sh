#!/bin/bash
setup_macos() {
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
}

for conf in $(ls dotfiles); do
    ln -sn $PWD/dotfiles/$conf $HOME/.config/$conf
done

# Determine which OS is in use
case "$(uname)" in
    Linux*)   INSTALL_CMD="yay -S";;
    Darwin*)  INSTALL_CMD="brew install";;
esac

# Install software
$INSTALL_CMD fish git cloc htop ncdu tree
$INSTALL_CMD alacritty neovim zellij zoxide
$INSTALL_CMD rustup rust-analyzer
$INSTALL_CMD go gopls
$INSTALL_CMD nodejs yarn
$INSTALL_CMD obsidian

if [[ "$(uname)" == "Linux" ]]; then
    $INSTALL_CMD rofi
    $INSTALL_CMD lxappearance adapta-gtk-theme papirus-icon-theme nerd-fonts-complete
    $INSTALL_CMD docker docker-compose
fi
