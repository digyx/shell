#!/usr/bin/env fish

function enter -d "Enter a toolbox for this project or create one if it does not exist"
    set TOOLBOX_NAME (basename $PWD)

    for container in (podman ps --format '{{.Names}}')
        if test $container = $TOOLBOX_NAME
            toolbox run -c $TOOLBOX_NAME emacs
            exit 0
        end
    end

    toolbox create --image localhost/dev-base:latest $TOOLBOX_NAME
    toolbox run -c $TOOLBOX_NAME emacs
end
