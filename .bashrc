function hostip() {
        local_host="`hostname --fqdn`"
        local_ip=`host $local_host 2>/dev/null | awk '{print $NF}'`

        echo "$local_ip"
}

function status_of_last_command() {
        RETVAL=$?
        if [ $RETVAL -ne 0 ]; then
                echo -e "\e[31m$RETVAL\e[0m"
        else
                echo "0"
        fi
}

function user() {
        if [ $(id -u) -eq 0 ]; then
                echo "#"
        else
                echo "$"
        fi
}

function parse_git_branch { 
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' 
}

export PS1="\u@`hostip`::[\t]::[Exit Code: \`status_of_last_command\`] ->\n\w \$(parse_git_branch) `user` "
