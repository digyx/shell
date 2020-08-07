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
    kubectl
    helm
    golang
    flutter
    docker
    doctl
    docker-compose
    cargo
    ansible
)

source $ZSH/oh-my-zsh.sh
