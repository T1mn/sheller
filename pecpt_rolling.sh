#!/bin/bash

SELF="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"

function docker_id() {
    local ID="$(docker container ls -f name="rolling-docker" | tail -n +2 | cut -d ' ' -f 1)"
    if [ -z "$ID" ]; then
        ID="$(docker container ls -af name="rolling-docker" | tail -n +2 | cut -d ' ' -f 1)"
        if [ -n "$ID" ]; then
            echo "Starting container $ID ..." >&2
            docker start "$ID" >/dev/null
        fi
    fi
    if [ -z "$ID" ]; then
        echo "Creating container ..." >&2
        ID="$(
            docker run -d -i --privileged \
            -v /etc/shadow:/etc/shadow:ro \
            -v /etc/passwd:/etc/passwd:ro \
            -v /etc/group:/etc/group:ro \
            -v /etc/sudoers:/etc/sudoers:ro \
            -v /usr/share/bash-completion:/usr/share/bash-completion \
            -v ${HOME}:${HOME} \
            -v "${SELF}:${SELF}" \
            -e HOME=${HOME} \
            -e USER=${USER} \
            -u $(id -u):$(id -g) \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -e DISPLAY=$DISPLAY \
            -e GDK_SCALE \
            -e GDK_DPI_SCALE \
            -w "$HOME" \
            -h "rolling-docker" \
            --name "rolling-docker" \
            10.133.122.84:80/build_env_local/public/ubuntu-20.04-ros2-rolling:latest \
            /bin/bash \
            )"
    fi
    echo "$ID"
}

function docker_exec() {
    docker exec --privileged -it "$(docker_id)" "$@"
}

function main() {
    for i in "$@"; do
        case "$i" in
        --container)
            cat ~/.passwd | sudo -S ip link add name lxc-bridge type bridge 2>/dev/null
            cat ~/.passwd | sudo -S ip link set eth0 master lxc-bridge
            cat ~/.passwd | sudo -S ifconfig lxc-bridge 192.168.10.100/24
            return
            ;;
        *)
            ;;
        esac
    done

    cat ~/.passwd | sudo -S ifconfig docker0 192.168.10.101/24
    docker_exec "${SELF}" --container

    echo "Project Path: $SELF_PATH"
    if [ "$1" = "runlxc" ]; then
      echo "launch lxc"
      docker_exec /bin/bash -c "cro;source build/envsetup.sh; lunch es37_ipd_lxc-eng; runemu -p;"
    elif [ "$1" = "stoplxc" ]; then
      echo "stop lxc"
      docker_exec /bin/bash -c "cro;source build/envsetup.sh; lunch es37_ipd_lxc-eng; runemu -p -s;"
    elif [ "$1" = "park_rviz2" ]; then
      echo "launch rviz2 $SELF_PATH"
      docker_exec /bin/bash -c "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp; export CYCLONEDDS_URI=/etc/cyclonedds_config.xml;source ~/.bashrc;pkill rviz2;sib;rv2p"
    elif [ "$1" = "park_proxy" ]; then
      echo "launch parkingrvizproxy"
      docker_exec /bin/bash -c "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp; export CYCLONEDDS_URI=/etc/cyclonedds_config.xml;pkill parking_rviz_node;sib;rrpr"
    elif [ "$1" = "plotjuggler" ]; then
      echo "launch plotjuggler"
      docker_exec /bin/bash -c "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp; export CYCLONEDDS_URI=/etc/cyclonedds_config.xml;pkill plotjuggler;sib;rrpj"
    else
      docker_exec /bin/bash 
    fi
}

main "$@"
