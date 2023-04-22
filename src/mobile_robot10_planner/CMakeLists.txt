cmake_minimum_required(VERSION 3.0.2)
project(mobile_robot10_planner)

find_package(catkin REQUIRED COMPONENTS
  controller_interface
  urdf
  realtime_tools
  tf
  nav_msgs
  roslaunch)

set(controller_sources
  src/controller.cpp
  src/odometry.cpp
  src/speed_limiter.cpp
)


catkin_package(
  INCLUDE_DIRS include
  LIBRARIES controller
  CATKIN_DEPENDS controller_interface realtime_tools
)

include_directories(${catkin_INCLUDE_DIRS})

set(controller_headers
  include/controller.h
  include/odometry.h
  include/speed_limiter.h
)

include_directories(include)
add_library(Odometry src/odometry.cpp)
add_library(SpeedLimiter src/speed_limiter.cpp)
add_library(MecanumDriveController src/controller.cpp)


add_library(controller ${controller_headers} ${controller_sources})
target_link_libraries(controller ${catkin_LIBRARIES})

install(TARGETS controller
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  )

install(FILES controller_plugins.xml
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

install(DIRECTORY config launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

if(CATKIN_ENABLE_TESTING)
  find_package(roslaunch REQUIRED)
  roslaunch_add_file_check(launch/control.launch)
endif()
