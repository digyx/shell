#!/usr/bin/env fish
function tbx -d "Enter a toolbox for this project or create one if it does not exist"
    set TOOLBOX_NAME (basename $PWD)
    set --local CMD $argv[1]

    switch $CMD
        case ""
            _tbx_create_if_not_exsits
        case -h --help
            echo "Usage: tbx                    Create and run emacs in toolbox for the project."
            echo "       tbx enter              Enter the toolbox the project."
            echo "       tbx create             Create a toolbox for the project."
            echo "       tbx emacs              Run emacs in the project's toolbox."
            echo "Options:"
            echo "       -h or --help           Print this help message"

        case create
            _tbx_create_if_not_exsits

        case enter
            toolbox enter $TOOLBOX_NAME

        case emacs
            _tbx_start_emacs

        case \*
            echo "tbx: Unknown command or option: \"$CMD\" (see tbx -h for usage)" >&2
            return 1
    end
end

function _tbx_create_if_not_exists
    set TOOLBOX_NAME (basename $PWD)

    for container in (podman ps --format '{{.Names}}')
        if test $container = $TOOLBOX_NAME
            return
        end
    end

    toolbox create --image localhost/dev-base:latest $TOOLBOX_NAME
end

function _tbx_start_emacs
    set TOOLBOX_NAME (basename $PWD)

    toolbox run -c $TOOLBOX_NAME emacs
end
