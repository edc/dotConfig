function fish_prompt
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end
    set pwd (sed -e 's/\/Users\/eddie/~/' (pwd | psub))
    if test (echo $pwd | wc -c) -ge 40
        set pwd (prompt_pwd)
    end
    set_color $fish_color_cwd
    echo -n $pwd
    set_color normal
    set branch (git branch ^/dev/null | grep \* | sed 's/* //')
    if test "$branch" != ""
        set_color brown
        echo -ns ' @' (git branch ^/dev/null | grep \* | sed 's/* //' | cut -c 1-20)
        set_color normal
    end
    echo ""
    echo -n '$ '
end
