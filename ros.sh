#!/bin/bash

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

export CYCLONEDDS_URI=/etc/cyclonedds_config.xml
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp