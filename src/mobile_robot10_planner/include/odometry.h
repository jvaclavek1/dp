#ifndef ODOMETRY_H_
#define ODOMETRY_H_

#include <ros/time.h>
#include <boost/accumulators/accumulators.hpp>
#include <boost/accumulators/statistics/stats.hpp>
#include <boost/accumulators/statistics/rolling_mean.hpp>
#include <boost/function.hpp>

namespace controller
{

namespace bacc = boost::accumulators;

/**
 * \brief The Odometry class handles odometry readings
 * (2D pose and velocity with related timestamp)
 */
class Odometry
{
public:

  /// Integration function, used to integrate the odometry:
  typedef boost::function<void(double, double, double)> IntegrationFunction;

  /**
   * \brief Constructor
   * Timestamp will get the current time value
   * Value will be set to zero
   * \param velocity_rolling_window_size Rolling window size used to compute the velocity mean
   */
  Odometry(size_t velocity_rolling_window_size = 10);

  /**
   * \brief Initialize the odometry
   * \param time Current time
   */
  void init(const ros::Time &time);

  /**
   * \brief Updates the odometry class with latest wheels position
   * \param wheel0_vel  Wheel velocity [rad]
   * \param wheel1_vel  Wheel velocity [rad]
   * \param wheel2_vel  Wheel velocity [rad]
   * \param wheel3_vel  Wheel velocity [rad]
   * \param time      Current time
   * \return true if the odometry is actually updated
   */
  bool update(double wheel0_vel, double wheel1_vel, double wheel2_vel, double wheel3_vel, const ros::Time &time);

  /**
   * \brief Updates the odometry class with latest velocity command
   * \param linearX  Linear velocity [m/s]
   * \param angular Angular velocity [rad/s]
   * \param time    Current time
   */
  void updateOpenLoop(double linearX, double linearY, double angular, const ros::Time &time);

  /**
   * \brief heading getter
   * \return heading [rad]
   */
  double getHeading() const
  {
    return heading_;
  }

  /**
   * \brief x position getter
   * \return x position [m]
   */
  double getX() const
  {
    return x_;
  }

  /**
   * \brief y position getter
   * \return y position [m]
   */
  double getY() const
  {
    return y_;
  }

  /**
   * \brief linearX velocity getter
   * \return linearX velocity [m/s]
   */
  double getLinearX() const
  {
    return linearX_;
  }

  /**
   * \brief linearY velocity getter
   * \return linearY velocity [m/s]
   */
  double getLinearY() const
  {
    return linearY_;
  }

  /**
   * \brief angular velocity getter
   * \return angular velocity [rad/s]
   */
  double getAngular() const
  {
    return angular_;
  }

  /**
   * \brief Sets the wheels parameters: mecanum geometric param and radius
   * \param wheels_k       Wheels geometric param (used in mecanum wheels' ik) [m]
   * \param wheels_radius  Wheels radius [m]
   */
  void setWheelsParams(double wheels_k, double wheels_radius);

private:

  /// Rolling mean accumulator and window:
  typedef bacc::accumulator_set<double, bacc::stats<bacc::tag::rolling_mean> > RollingMeanAcc;
  typedef bacc::tag::rolling_window RollingWindow;

  /**
   * \brief Integrates the velocities (linear and angular) using exact method
   * \param linearX  Linear velocity along X [m] (linear  displacement, i.e. m/s * dt) computed by encoders
   * \param linearY  Linear velocity along Y [m] (linear  displacement, i.e. m/s * dt) computed by encoders
   * \param angular Angular velocity [rad] (angular displacement, i.e. m/s * dt) computed by encoders
   */
  void integrateExact(double linearX, double linearY, double angular);

  /// Current timestamp:
  ros::Time timestamp_;

  /// Current pose:
  double x_;        //   [m]
  double y_;        //   [m]
  double heading_;  // [rad]

  /// Current velocity:
  double linearX_;  //   [m/s]
  double linearY_;  //   [m/s]
  double angular_; // [rad/s]

  /// Wheels kinematic parameters [m]:
  double wheels_k_;
  double wheels_radius_;

  /// Rolling mean accumulators for the linar and angular velocities:
  size_t velocity_rolling_window_size_;
  RollingMeanAcc linearX_acc_;
  RollingMeanAcc linearY_acc_;
  RollingMeanAcc angular_acc_;

  /// Integration funcion, used to integrate the odometry:
  IntegrationFunction integrate_fun_;
};

} // namespace mecanum_drive_controller

#endif /* ODOMETRY_H_ */