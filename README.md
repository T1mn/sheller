# 脚本工具集合

本仓将在可见的未来里增加多种跟业务相关的shell脚本,帮助使用者提高工作效率

## install

### shell

```
cd ${shell_tools_path}
bash ./install.sh
```

## man
### daily.sh

记录每日工作日志脚本

- 配置
```
cd ${shell_tools_path}
sudo ln -s ${PWD}/daily.sh /etc/daily.sh  
echo "source /etc/daily.sh">>~/.bashrc
echo "source /etc/daily.sh">>~/.zshrc
```
- 使用
重新打开终端
- 执行`vim_daily` 使用vim打开当日工作note.md
- 执行`open_daily` 打开当日工作文件夹,存放需要储存的文件

### ros.sh
```
cd ${shell_tools_path}
sudo ln -s ${PWD}/ros.sh /etc/ros.sh
echo "source /etc/ros.sh">>~/.bashrc
echo "source /etc/ros.sh">>~/.zshrc
```

