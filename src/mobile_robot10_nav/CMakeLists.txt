cmake_minimum_required(VERSION 3.0.2)
project(mobile_robot10_nav)

find_package(catkin REQUIRED COMPONENTS roslaunch)


catkin_package()

install(
DIRECTORY launch map params worlds
DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

if(CATKIN_ENABLE_TESTING)
  find_package(roslaunch REQUIRED)
  roslaunch_add_file_check(launch/odom_nav.launch)
  roslaunch_add_file_check(launch/include/amcl.launch)
  roslaunch_add_file_check(launch/include/gmapping.launch)
endif()
