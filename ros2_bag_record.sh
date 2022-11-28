#!/bin/bash
echo "${rosbag_path}"

function rbrapa () {
    cd ${rosbag_path}/parking/apa && ros2 bag record /PK/DR/DeltaInfo /PK/DR/Result /PK/PER/VisionParkingSegInput /PK/PER/VisionFreespaceInferList /PK/PER/VisionPerceptionSlots /PK/PER/VisionSlotListInfo /PI/EG/EgoMotionInfo
}

function rbrhpp () {
    cd ${rosbag_path}/parking/hpp  && ros2 bag record /PK/PER/VisionParkingDecodingList /PK/DR/DeltaInfo /PK/DR/Result /PK/PER/VisionParkingDecodingList /PK/PER/VisionParkingObjList /PK/PER/VisionParkingSegInput /PK/PER/VisionPerceptionSlots /PI/EG/EgoMotionInfo /PK/PER/VisionParkingObjList /PK/PER/VisionSlotListInfo /PK/PER/UssSlots /PK/PER/VisionParkingSegInput /PK/OccupancyGridMap /PK/TF/MapToBase
}

