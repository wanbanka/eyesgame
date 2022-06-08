import 'dart:math';

/**
 * Service handling computing moves (trajectory, character's position...)
 */

class MathService {
  late double _angleTrajectory;

  /**
   * Compute the future position of a character
   */

  double computeTrajectory(double gravity, double velocity, double time,
      {bool isXAxis = true}) {
    if (isXAxis) {
      _computeAngle(gravity, velocity, time);

      print("X: ${velocity * cos(_angleTrajectory) * time}");
    } else {
      print(
          "Y: ${(-0.5 * gravity * (pow(time, 2))) + (velocity * sin(1 - _angleTrajectory) * time)}");
    }

    return isXAxis
        ? velocity * cos(_angleTrajectory) * time
        : (-0.5 * gravity * (pow(time, 2))) +
            (velocity * sin(1 - _angleTrajectory) * time);
  }

  /**
   * Compute the angle of the character's trajectory
   */

  void _computeAngle(double gravity, double velocityX, double time) {
    _angleTrajectory =
        velocityX != 0 ? (0.5 * asin((gravity * time) / velocityX)) : 0;
  }
}
