#include "../include/odometry.h"

#include <tf/transform_datatypes.h>

#include <boost/bind.hpp>

namespace controller
{

namespace bacc = boost::accumulators;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Odometry::Odometry(size_t velocity_rolling_window_size)
: timestamp_(0.0)
, x_(0.0)
, y_(0.0)
, heading_(0.0)
, linearX_(0.0)
, linearY_(0.0)
, angular_(0.0)
, wheels_k_(0.0)
, wheels_radius_(0.0)
, velocity_rolling_window_size_(velocity_rolling_window_size)
, linearX_acc_(RollingWindow::window_size = velocity_rolling_window_size)
, linearY_acc_(RollingWindow::window_size = velocity_rolling_window_size)
, angular_acc_(RollingWindow::window_size = velocity_rolling_window_size)
, integrate_fun_(boost::bind(&Odometry::integrateExact, this, _1, _2, _3))
{
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Odometry::init(const ros::Time& time)
{
  // Reset accumulators:
  linearX_acc_ = RollingMeanAcc(RollingWindow::window_size = velocity_rolling_window_size_);
  linearY_acc_ = RollingMeanAcc(RollingWindow::window_size = velocity_rolling_window_size_);
  angular_acc_ = RollingMeanAcc(RollingWindow::window_size = velocity_rolling_window_size_);

  // Reset timestamp:
  timestamp_ = time;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
bool Odometry::update(double wheel0_vel, double wheel1_vel, double wheel2_vel, double wheel3_vel, const ros::Time &time)
{
  /// We cannot estimate the speed with very small time intervals:
  const double dt = (time - timestamp_).toSec();
  if (dt < 0.0001)
    return false; // Interval too small to integrate with

  timestamp_ = time;

  /// Compute forward kinematics (i.e. compute mobile robot's body twist out of its wheels velocities):
  /// NOTE: we use the IK of the mecanum wheels which we invert using a pseudo-inverse.
  /// NOTE: in the diff drive the velocity is filtered out, but we prefer to return it raw and let the user perform
  ///       post-processing at will. We prefer this way of doing as filtering introduces delay (which makes it
  ///       difficult to interpret and compare behavior curves).
  linearX_ = 0.25 * wheels_radius_              * ( wheel0_vel + wheel1_vel + wheel2_vel + wheel3_vel);
  linearY_ = 0.25 * wheels_radius_              * (-wheel0_vel + wheel1_vel - wheel2_vel + wheel3_vel);
  angular_ = 0.25 * wheels_radius_  / wheels_k_ * (-wheel0_vel - wheel1_vel + wheel2_vel + wheel3_vel);

  /// Integrate odometry.
  integrate_fun_(linearX_ * dt, linearY_ * dt, angular_ * dt);

  return true;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Odometry::updateOpenLoop(double linearX, double linearY, double angular, const ros::Time &time)
{
  /// Save last linear and angular velocity:
  linearX_ = linearX;
  linearY_ = linearY;
  angular_ = angular;

  /// Integrate odometry:
  const double dt = (time - timestamp_).toSec();
  timestamp_ = time;
  integrate_fun_(linearX * dt, linearY * dt, angular * dt);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Odometry::setWheelsParams(double wheels_k, double wheels_radius)
{
  wheels_k_ = wheels_k;

  wheels_radius_ = wheels_radius;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Odometry::integrateExact(double linearX, double linearY, double angular)
{
  /// Integrate angular velocity.
  heading_ += angular;

  /// The odometry pose should be published in the /odom frame (unlike the odometry twist which is a body twist).
  /// Project the twist in the odometry basis (we cannot integrate linearX, linearY, angular 'as are' because they correspond to a body twist).
  tf::Matrix3x3 R_m_odom = tf::Matrix3x3(tf::createQuaternionFromYaw(heading_));
  tf::Vector3 vel_inOdom = R_m_odom * tf::Vector3(linearX, linearY, 0.0);

  /// Integrate linear velocity.
  x_ += vel_inOdom.x();
  y_ += vel_inOdom.y();
}

} // namespace mecanum_drive_controller