if [[ "$(uname)" == "Darwin" ]]; then
    export ZSH="/Users/$(whoami)/.oh-my-zsh"
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    export ZSH="/home/$(whoami)/.oh-my-zsh"
fi

ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX="true"

plugins=(
    git
    z
    zsh-autosuggestions
    sudo
    thefuck
    redis-cli
    golang
    docker
    docker-compose
    cargo
    rustup
    python
    yarn
)

export GDK_SCALE=1.5
export GDK_DPI_SCALE=1.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1.5

source $ZSH/oh-my-zsh.sh

export $(grep -v '^#' .env | tr -d '"' | xargs -d '\n')
