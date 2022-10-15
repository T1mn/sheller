#!/bin/bash

# install all .sh in this project

# vars
path=$(dirname $(readlink -f "$0"))
target_path="/etc"

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
            echo "skip "$1">>"$shell_config" ..."
        else
            echo "start "$1">>"$shell_config" ..."
            echo "$1">>"$shell_config"
        fi
    done
}

# install
function install_shell_tools () {
    get_base_shell_config
    echo 'start installing...'
    update_shell_config "export SHELL_PATH=${path}" # update env
    files=$(ls $path | grep ".sh$" | grep -v "install")
    for filename in $files
    do
        source_file="$path"/"$filename"
        target_file="$target_path"/"$filename"
        $(sudo rm -rf "${target_file}")
        $(sudo ln -s "${source_file}" "${target_file}")
        update_shell_config "source ${target_file}"
    done
    echo 'install complete'
}

# start
install_shell_tools