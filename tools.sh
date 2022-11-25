#!/bin/bash

# shell find
# Path: tools.sh

park_headq_node_dir="parking_perception_headquarter_asf_node"
park_slot_detec_node_dir="parking_perception_slots_detection_asf_node"

summervibe_path=""
repo_orin_path=""

function find_target_return_list () {
    (find ~/ -type d -name  "$1" 2>/dev/null)
}

function init_work_path () {
    echo "hi, please keep only one git project in your home directory"
    echo "Which path u want to init?"
    url_lists=( 
    "orin" 
    "summervibe" 
    "park_slot_node" 
    "park_headq_node"
    )
    select name in "${url_lists[@]}"
    do
        case $name in
            "orin")
                local target_path_array=($(find ~/ -type d -name  "parking_perception_headquarter_asf_node" 2>/dev/null))
                for target_path in "${target_path_array[@]}";
                do
                if [[ "${target_path}" == *"packages"* ]]; then
                    echo "orin path is ${target_path%\/packages*}? y/n"
                    read -r answer
                    echo "${answer}"
                    if [[ "${answer}" == "y" ]]; then
                        repo_orin_path="${target_path%\/packages*}"
                        break
                    fi
                fi
                done
                break
                ;;
            "summervibe")
                local target_path_array=($(find ~/ -type d -name  "summervibe" 2>/dev/null))
                for target_path in "${target_path_array[@]}";
                do
                    echo "summervibe path is ${target_path}? y/n"
                    read -r answer
                    if [[ "${answer}" == "y" ]]; then
                        summervibe_path="${target_path}"
                        break
                    fi
                done
                break
                ;;
            *)
                echo "输入错误，请重新输入"
        esac
    done
}




