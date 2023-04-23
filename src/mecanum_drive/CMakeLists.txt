cmake_minimum_required(VERSION 2.8.3)
project(mecanum_drive)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  nav_msgs
  geometry_msgs
  tf
  tf2
  actionlib
  actionlib_msgs
)

add_action_files(
  DIRECTORY action
  FILES GoToPose.action
)


catkin_install_python(
    PROGRAMS
        src/mecanum_drive/mecanum_drive_odometry
        src/mecanum_drive/mecanum_drive_controller
    DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

catkin_python_setup()

generate_messages (
  DEPENDENCIES actionlib_msgs std_msgs geometry_msgs
)

catkin_package(
  CATKIN_DEPENDS actionlib_msgs
)

install(DIRECTORY config launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

if(CATKIN_ENABLE_TESTING)
  find_package(roslaunch REQUIRED)
  roslaunch_add_file_check(launch/control.launch)
endif()
