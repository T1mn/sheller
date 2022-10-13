# 脚本工具集合

本仓将在可见的未来里增加多种跟业务相关的shell脚本,帮助使用者提高工作效率

## daily.sh

记录每日工作日志脚本

- 配置
```
cd ${shell_tools_path}
sudo cp ./daily.sh /usr/bin/
echo "source /usr/bin/daily.sh">>~/.bashrc
echo "source /usr/bin/daily.sh">>~/.zshrc
```
- 使用
重新打开终端
- 执行`vim_daily` 使用vim打开当日工作note.md
- 执行`open_daily` 打开当日工作文件夹,存放需要储存的文件

## ros.sh

同上，替换daily.sh为ros.sh
