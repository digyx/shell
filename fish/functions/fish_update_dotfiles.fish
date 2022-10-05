function fish_update_dotfiles
    for conf in (ls)
        ln --force -sn $PWD/$conf $HOME/.config/$conf
    end
end
