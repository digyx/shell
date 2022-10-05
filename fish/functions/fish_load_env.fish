function fish_load_env
    for i in (cat $argv)
        set arr (echo $i | tr = \n)
        set -gx $arr[1] (echo $arr[2] | tr -d '"')
    end
end
