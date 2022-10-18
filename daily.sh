#!/bin/bash

date_time=$(date "+%Y_%m_%d")
daily_path=/home/"${USER}"/workspace/daily/"${date_time}"
daily_code_path=/home/"${USER}"/workspace/daily/"${date_time}"/code
echo "today is ${date_time}"

if [ ! -d "${daily_path}" ]; then
	{
		mkdir -p "${daily_path}"
	}
fi

if [ ! -d "${daily_code_path}" ]; then
	{
		mkdir "${daily_code_path}"
	}
fi

fuction vim_daily(){
	vim "${daily_path}"/notes.md
}

fuction open_daily(){
	nautilus "${daily_path}"
}
