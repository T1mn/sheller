#!/bin/bash

code_path="/usr/bin/code"
date_time=$(date "+%Y_%m_%d")
daily_path=/home/"${USER}"/workspace/daily/"${date_time}"

daily_paths=( "${daily_path}/code" "${daily_path}/doc" "${daily_path}/pic" )

function mk_daily () {
	if [ ! -d "$1" ]; then
	{		
		echo "update files of $1"
		mkdir -p "$1"
	}
	fi
}

function init_daily () {
    echo "today is ${date_time}"
	for daily_path in "${daily_paths[@]}";
	do
		# echo "$daily_path"
		mk_daily "${daily_path}"
	done
}

function vim_daily () {
	vim "${daily_path}"/notes.md
}

function open_daily () {
	nautilus "${daily_path}"
}

function code_daily () {
	if [ ! -x ${code_path} ];then
	    echo "can not find code, please download it!"
	    return;
	fi
		code "${daily_path}"
}

init_daily