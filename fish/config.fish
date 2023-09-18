set -x CHROME_EXECUTABLE /usr/bin/chromium
set -x EDITOR /usr/bin/nvim
set -x DOOMDIR $HOME/.config/doom

fish_add_path ~/.cargo/bin
fish_add_path ~/.yarn/bin

if type -q rtx
    rtx activate fish | source
end

if status is-interactive
    zoxide init fish | source
    starship init fish | source
end
