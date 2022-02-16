set -x CHROME_EXECUTABLE /usr/bin/chromium
set -x EDITOR /usr/bin/nvim

if status is-interactive
    zoxide init fish | source
end
