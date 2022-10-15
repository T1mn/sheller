- [脚本工具集合](#脚本工具集合)
  - [安装](#安装)
    - [一键安装](#一键安装)
    - [手动安装（不建议）](#手动安装不建议)
      - [daily.sh](#dailysh)
  - [特性](#特性)
    - [daily.sh](#dailysh-1)
    - [chrome.sh](#chromesh)
    - [ros.sh](#rossh)
# 脚本工具集合

本仓将在可见的未来里增加多种跟业务相关的shell脚本，旨在帮助用户**提高工作效率**

## 安装

### 一键安装

```
cd ${shell_tools_path}
bash ./install.sh
```

### 手动安装（不建议）
#### daily.sh

记录每日工作日志脚本

- 配置
```
cd ${shell_tools_path}
sudo ln -s ${PWD}/daily.sh /etc/daily.sh  
echo "source /etc/daily.sh">>~/.bashrc
echo "source /etc/daily.sh">>~/.zshrc
```

其他脚本如上

## 特性

### daily.sh

- 脚本自动获取当前日期，能够在`/home/"${USER}"/workspace/daily/`自动创建以当天日期命名的文件夹
- 自动创建notes.md（记录工作日志）和code文件夹（存放代码）
  
- 执行`vim_daily` 使用vim打开当日工作note.md
- 执行`open_daily` 打开当日工作文件夹,存放需要储存的文件

文件结构如下所示：
```
.
├── daily
│   ├── 2022_10_13
│   │   ├── code
│   │   └── notes.md
│   ├── 2022_10_14
│   │   ├── code
│   │   └── notes.md
│   ├── 2022_10_15
│   │   ├── code
│   │   └── notes.md
```

TODO: 增加TODOLIST到交互shell中

### chrome.sh

- 一键后台打开网站，避免手动打开chrome，输入网址的繁琐工作量
- 脚本自动配置域内常用网站，避免新电脑没有收藏域内网址需要口头询问同事
  
- 执行cm，选取目标网站编号

命令交互界面如下：
```
today is 2022_10_15
❯ cm
Which u want to open?
1) chrome      3) confluence  5) outlook     
2) gerrit      4) jira        6) nothing
```


TODO: 增加用户添加网址交互命令

### ros.sh

- 适配ros2，精简激活、编译、运行、`rviz`、`ros bag`、`ros topic`等命令

- 执行alias对应的命令
  
部分操作如下：
```
# source_ros
alias srb="source /opt/ros/rolling/setup.bash"
alias srz="source /opt/ros/rolling/setup.zsh"
alias sib="source install/setup.bash"
alias siz="source install/setup.zsh"

# colcon_build
alias cbpu="colcon build --packages-up-to "
alias cbvtd="cbpu all_msgs vtd_pkg pecpt_park_rviz_node function_management_rviz_plugin"
alias cbrpk="cbpu pecpt_park_rviz_node"
alias cbrpi="cbpu pecpt_pilot_rviz_node"

# ros run
alias rr="ros2 run "
alias rrpj="rr plotjuggler plotjuggler"
alias rrparkr="rr pecpt_park_rviz_node pecpt_park_rviz_node"
alias rrpilor="rr pecpt_pilot_rviz_node pecpt_pilot_rviz_node"

# rviz
alias rv2="rviz2 "
alias rvizpk="rv2 -d asf_nodes/simulation/pecpt/pecpt_park_rviz/pecpt_park.rviz"

# ros bag play
alias rbp="ros2 bag play "
alias rbpl="rbp -l "

# ros launch
alias rl="ros2 launch "
alias rlvtd="rl asf_nodes/simulation/vtd_pkg/launch/vtd_test.py"

# ros topic list
alias rt="ros2 topic "
alias rtl="rt list"
alias rtlpecpt="rt list | grep "perc" "
alias rthz="rt hz "
alias rti="rt info "
```

TODO: 使用function替换部分alias，增加可选功能，减少记忆工作量