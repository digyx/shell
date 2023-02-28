function update
    switch (uname)
        case Linux
            if type -q yay
                yay
            end

            if type -q flatpak
                flatpak update
            end
        case Darwin
            brew upgrade
        case '*'
            echo "Unsupported OS"
            exit 1
    end

    if type -q gup
        gup update
    end

    if type -q pipx
        pipx upgrade-all
    end

    if type -q cargo
        cargo install-update --all
    end
end
