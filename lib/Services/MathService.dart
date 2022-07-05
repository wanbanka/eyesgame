import 'dart:math';

/**
 * Service handling moves' computing (trajectory, character's position...)
 */

class MathService {
  /**
   * Compute the future position of a character
   */

  List<double> computeTrajectory(
      double gravity, List<double> velocity, double time,
      {bool isOnWall = false, bool isOnCeiling = false}) {
    double landAngle = _computeAngle(gravity, velocity[0], time);

    const restitutionCoeff = 0.075;

    bool isVelocityZero =
        velocity.reduce((value, element) => value + element) == 0;

    double newX = !isVelocityZero ? velocity[0] * cos(1 - landAngle) * time : 0;

    double newY = (-0.5 * gravity * (pow(time, 2))) +
        (!isVelocityZero ? velocity[1] * sin(1 - landAngle) * time : 0);

    if (isOnWall) {
      newX *= -restitutionCoeff;
    } else if (isOnCeiling) {
      newY += 1;
    }

    return [newX, newY];
  }

  /**
   * Compute the angle of the character's trajectory
   */

  double _computeAngle(double gravity, double velocityX, double time) {
    return velocityX != 0 ? 0.5 * asin((gravity * time) / velocityX) : 0;
  }
}
