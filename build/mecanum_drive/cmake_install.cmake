# Install script for directory: /home/vaclavekjan/catkin_ws4/src/mecanum_drive

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/vaclavekjan/catkin_ws4/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecanum_drive/action" TYPE FILE FILES "/home/vaclavekjan/catkin_ws4/src/mecanum_drive/action/GoToPose.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecanum_drive/msg" TYPE FILE FILES
    "/home/vaclavekjan/catkin_ws4/devel/share/mecanum_drive/msg/GoToPoseAction.msg"
    "/home/vaclavekjan/catkin_ws4/devel/share/mecanum_drive/msg/GoToPoseActionGoal.msg"
    "/home/vaclavekjan/catkin_ws4/devel/share/mecanum_drive/msg/GoToPoseActionResult.msg"
    "/home/vaclavekjan/catkin_ws4/devel/share/mecanum_drive/msg/GoToPoseActionFeedback.msg"
    "/home/vaclavekjan/catkin_ws4/devel/share/mecanum_drive/msg/GoToPoseGoal.msg"
    "/home/vaclavekjan/catkin_ws4/devel/share/mecanum_drive/msg/GoToPoseResult.msg"
    "/home/vaclavekjan/catkin_ws4/devel/share/mecanum_drive/msg/GoToPoseFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/mecanum_drive" TYPE PROGRAM FILES "/home/vaclavekjan/catkin_ws4/build/mecanum_drive/catkin_generated/installspace/mecanum_drive_odometry")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/mecanum_drive" TYPE PROGRAM FILES "/home/vaclavekjan/catkin_ws4/build/mecanum_drive/catkin_generated/installspace/mecanum_drive_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/vaclavekjan/catkin_ws4/build/mecanum_drive/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecanum_drive/cmake" TYPE FILE FILES "/home/vaclavekjan/catkin_ws4/build/mecanum_drive/catkin_generated/installspace/mecanum_drive-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/vaclavekjan/catkin_ws4/devel/include/mecanum_drive")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/vaclavekjan/catkin_ws4/devel/share/roseus/ros/mecanum_drive")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/vaclavekjan/catkin_ws4/devel/share/common-lisp/ros/mecanum_drive")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/vaclavekjan/catkin_ws4/devel/share/gennodejs/ros/mecanum_drive")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/vaclavekjan/catkin_ws4/devel/lib/python3/dist-packages/mecanum_drive")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/vaclavekjan/catkin_ws4/devel/lib/python3/dist-packages/mecanum_drive" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/vaclavekjan/catkin_ws4/devel/lib/python3/dist-packages/mecanum_drive" FILES_MATCHING REGEX "/home/vaclavekjan/catkin_ws4/devel/lib/python3/dist-packages/mecanum_drive/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/vaclavekjan/catkin_ws4/build/mecanum_drive/catkin_generated/installspace/mecanum_drive.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecanum_drive/cmake" TYPE FILE FILES "/home/vaclavekjan/catkin_ws4/build/mecanum_drive/catkin_generated/installspace/mecanum_drive-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecanum_drive/cmake" TYPE FILE FILES
    "/home/vaclavekjan/catkin_ws4/build/mecanum_drive/catkin_generated/installspace/mecanum_driveConfig.cmake"
    "/home/vaclavekjan/catkin_ws4/build/mecanum_drive/catkin_generated/installspace/mecanum_driveConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecanum_drive" TYPE FILE FILES "/home/vaclavekjan/catkin_ws4/src/mecanum_drive/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mecanum_drive" TYPE DIRECTORY FILES
    "/home/vaclavekjan/catkin_ws4/src/mecanum_drive/config"
    "/home/vaclavekjan/catkin_ws4/src/mecanum_drive/launch"
    )
endif()

