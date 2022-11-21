#!/bin/bash

function cm()
{
chrome_path="/usr/bin/google-chrome"

if [ ! -x ${chrome_path} ];then
    echo "can not find chrome, please download it!"
    return;
fi

echo "Which u want to open?"
url_lists=( 
  "chrome" 
  "gerrit" 
  "confluence" 
  "jira" 
  "JFrog"
  "outlook"
  "nothing"
)

select name in "${url_lists[@]}"
do
    case $name in
        "chrome")
            /usr/bin/google-chrome >/dev/null 2>&1 &
            break
            ;;
        "gerrit")
            /usr/bin/google-chrome --new-window http://10.133.122.71 >/dev/null 2>&1 &
            break
            ;;
        "confluence")
            /usr/bin/google-chrome --new-window http://10.133.144.15:8080 >/dev/null 2>&1 &
            break
            ;;
        "jira")
            /usr/bin/google-chrome --new-window http://10.133.144.14:8080/browse/HPC2AD-6082?filter=-1 >/dev/null 2>&1 &
            break
            ;;
	"JFrog")
	    /usr/bin/google-chrome --new-window http://10.133.122.84:80/ >/dev/null 2>&1 &
	    break
	    ;;
        "nothing")
            break
            ;;
        "outlook")
            /usr/bin/google-chrome --new-window https://outlook.saicmotor.com/ >/dev/null 2>&1 &
            break
            ;;
        *)
            echo "输入错误，请重新输入"
    esac
done
}
