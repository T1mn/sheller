#!/bin/bash

# install all .sh in this project

# vars
path=$(dirname $(readlink -f "$0"))
target_path="/home/${USER}/.shell_tools"

# init directory
function init () {
    if [ -d "/home/${USER}/.shell_tools" ]; then
        echo "directory \"/home/${USER}/.shell_tools\" exists"
    else
        echo "create directory \"/home/${USER}/.shell_tools\""
        $(mkdir -p /home/${USER}/.shell_tools)
    fi
}

# find configs(shrc)
function get_base_shell_config () {
    shell_configs=$(ls -a /home/${USER} | grep "^\..*shrc$" | sed "s:^:/home/${USER}/:")
}

# add $1 in shell configs
function update_shell_config () {
    for shell_config in $shell_configs
    do
        # echo "grep -c \""$1"\" "$shell_config""
        if [ $(grep -c "$1" $shell_config) -ne '0' ];then
            echo "update "$1">>"$shell_config" ..."
            # echo "$2"
            filename_=$(echo "$2" | sed 's/\./\\&/g' | sed 's/\//\\&/g')
            # echo "sed -i "/"$filename_"/d" "$shell_config""
            sed -i "/"$filename_"/d" "$shell_config"
        else
            echo "start "$1">>"$shell_config" ..."
        fi
        echo "$1">>"$shell_config"
    done
}

# install
function install_shell_tools () {
    init
    get_base_shell_config
    echo 'start installing...'
    update_shell_config "export SHELL_PATH=${path}" "${path}" # update env
    files=$(ls $path | grep ".sh$" | grep -v "install")
    for filename in $files
    do
        source_file="$path"/"$filename"
        target_file="$target_path"/"$filename"
        $(sudo rm -rf "${target_file}")
        $(sudo ln -s "${source_file}" "${target_file}")
        update_shell_config "source ${target_file}" "$filename"
    done
    echo 'install complete'
}

# start
install_shell_tools