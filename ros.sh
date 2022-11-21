#!/bin/bash

# source_ros
alias seb="source /opt/ros/rolling/setup.bash"
alias sez="source /opt/ros/rolling/setup.zsh"
alias sib="source /home/${USER}/repo/orin/packages/install/setup.bash"
alias siz="source /home/${USER}/repo/orin/packages/install/setup.zsh"
alias rosenv_b="seb && sib"
alias rosenv_z="sez && sib"

# cd repo orin
alias cro="cd /home/${USER}/repo/orin"
alias crop="cd /home/${USER}/repo/orin/packages"
# rolling_docker
alias rolling="/home/${USER}/repo/orin/packages/asf_nodes/script/docker_rolling.sh"
alias ros2_docker="/home/${USER}/repo/orin/packages/asf_nodes/script/docker.sh"
# record parking
alias rrcp="/home/${USER}/repo/orin/packages/asf_nodes/script/record_parking.sh"
alias rrcd="/home/${USER}/repo/orin/packages/asf_nodes/script/record_driving.sh"


# colcon_build
alias cbpu="colcon build --packages-up-to "
alias cbvtd="cbpu all_msgs vtd_pkg pecpt_park_rviz_node function_management_rviz_plugin"
alias cbrp="cbpu pecpt_park_rviz_node"
alias cbrd="cbpu pecpt_pilot_rviz_node"

# ros run
alias rr="ros2 run "
alias rrpj="rr plotjuggler plotjuggler"
alias rrpr="rr pecpt_park_rviz_node pecpt_park_rviz_node"
alias rrdr="rr pecpt_pilot_rviz_node pecpt_pilot_rviz_node"
# ros run topic hz
alias rrth="rr topichz topichz "

# ros topic hz per
alias rtlPK_PER="ros2 topic list | grep PK/PER"
alias rtlPK="ros2 topic list | grep PK"

# rviz
alias rv2="rviz2 "
alias rv2p="rv2 -d asf_nodes/simulation/pecpt/pecpt_park_rviz/pecpt_park.rviz"

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
