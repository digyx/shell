set -x CHROME_EXECUTABLE /usr/bin/chromium
set -x EDITOR /usr/bin/nvim
set -x DOOMDIR $HOME/.config/doom

fish_add_path ~/.cargo/bin
fish_add_path ~/.yarn/bin

if [ $hostname = Arcadia-III ]
    set -x GDK_SCALE 2
    set -x GDK_DPI_SCALE 0.5
end

if status is-interactive
    zoxide init fish | source
end
