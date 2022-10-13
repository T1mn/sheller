!#/bin/bash

alias srb="source /opt/ros/rolling/setup.bash"
alias srz="source /opt/ros/rolling/setup.zsh"
alias cbpu="colcon build --packages-up-to "
alias cbvtd="colcon build --packages-up-to all_msgs vtd_pkg rviz_proxy_node parking_rviz_node function_management_rviz_plugin"
alias rr="ros2 run "
# alias plotjuggler="rr plot

alias rbp="ros2 bag play "
alias rbpl="ros2 bag play -l "
alias rlvtd="ros2 launch asf_nodes/simulation/vtd_pkg/launch/vtd_test.py"

alias sib="source install/setup.bash"
alias siz="source install/setup.zsh"

alias rtl="ros2 topic list"
alias rtl="ros2 topic list | grep "perc" "

alias rrpj="ros2 run plotjuggler plotjuggler"
alias rrparkr="ros2 run pecpt_park_rviz_node pecpt_park_rviz_node"
alias rrpilor="ros2 run pecpt_pilot_rviz_node pecpt_pilot_rviz_node"
alias ros_rviz_with_park="rviz2 -d asf_nodes/simulation/pecpt/pecpt_park_rviz/pecpt_park.rviz"

export CYCLONEDDS_URI=/etc/cyclonedds_config.xml
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
