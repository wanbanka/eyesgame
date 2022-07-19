import 'package:flame/components.dart' show Vector2, PositionComponent;

import 'package:flame/collisions.dart' show ScreenHitbox;

import '../../../Models/Enums/Force.dart';

import '../../Backgrounds/ParallaxBackground.dart';

import '../../Platforms/Platform.dart';

/**
 * System for collision detection and trajectory computing
 * (rebounds, parable...)
 */

mixin CollisionSystem on PositionComponent {
  bool isOnGround = false;

  bool isOnWall = false;

  bool isOnPlatform = false;

  bool isOnCeiling = false;

  Vector2 _velocity = Vector2.zero();

  Vector2 get velocity => this._velocity;

  set velocity(Vector2 value) => this._velocity = value;

  Vector2 _gravity = Vector2(1, 9.81);

  Vector2 get gravity => this._gravity;

  set gravity(Vector2 value) => this._gravity = value;

/**
   * Handle the collision with the screen's boundaries
   */

  void handleScreenCollision(Set<Vector2> intersectionPoints) {
    final collisionNormal = _getNormalCollision(intersectionPoints);

    double innerLeft = _getInnerProduct(collisionNormal, Force.left);

    double innerRight = _getInnerProduct(collisionNormal, Force.right);

    double innerTop = _getInnerProduct(collisionNormal, Force.up);

    if (innerLeft > 0.9 || innerRight > 0.9) {
      this.isOnGround = false;

      this.isOnPlatform = false;

      this.isOnCeiling = false;

      this.isOnWall = true;
    }

    if (innerTop > 0.9) {
      this.isOnGround = false;

      this.isOnPlatform = false;
      this.isOnCeiling = true;
      this.isOnWall = false;
    }

    double scaleCollision = 0.0;

    if (innerLeft > 0.9) {
      scaleCollision = -innerLeft;
    } else if (innerRight > 0.9) {
      scaleCollision = -innerRight;
    } else if (innerTop > 0.9) {
      scaleCollision = -innerTop;
    }

    position -= collisionNormal.scaled(scaleCollision);
  }

/**
   * Handle the collision with the floor
   */

  void handleFloorCollision(Set<Vector2> intersectionPoints) {
    final collisionNormal = _getNormalCollision(intersectionPoints);

    double inner = _getInnerProduct(collisionNormal, Force.down);

    print("Inner prod floor: $inner");

    if (inner.abs() > 0.9) {
      this.isOnGround = true;
      this.isOnWall = false;
      this.isOnPlatform = false;
      this.isOnCeiling = false;

      this.velocity = Vector2.zero();
    }

    position += collisionNormal.scaled(inner);
  }

  /**
   * Handle the collision with the platforms
   */

  void handlePlatformCollision(Set<Vector2> intersectionPoints) {
    final collisionNormal = _getNormalCollision(intersectionPoints);

    double inner = _getInnerProduct(collisionNormal, Force.down);

    if (inner > 0.79 || inner > -0.25) {
      position += collisionNormal.scaled(inner);

      this.isOnGround = false;
      this.isOnWall = false;

      this.isOnCeiling = false;

      if (inner > 0.79) {
        this.isOnPlatform = true;

        this.velocity = Vector2.zero();
      } else {
        this.isOnPlatform = false;
      }
    }
  }

/**
 * Compute collisions according to the type of collidable
 * objects
 */

  void computeCollision(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    print(
        "Intersection points: $intersectionPoints et component: ${other.runtimeType}");

    if (intersectionPoints.length == 2) {
      print("Normal collision: ${_getNormalCollision(intersectionPoints)}");

      switch (other.runtimeType) {
        case ParallaxBackground:
          handleFloorCollision(intersectionPoints);
          break;

        case ScreenHitbox:
          handleScreenCollision(intersectionPoints);
          break;
      }

      if (other is Platform) {
        handlePlatformCollision(intersectionPoints);
      }
    }

    print("IsOnPlatform ? : $isOnPlatform");
  }

  /**
   * Compute the collision's point between two components
   */

  Vector2 _getNormalCollision(Set<Vector2> intersectionPoints) {
    return (absoluteCenter -
            ((intersectionPoints.elementAt(0) +
                    intersectionPoints.elementAt(1)) /
                2))
        .normalized();
  }

/**
 * Make an inner product between the collision and the applied
 * pressure by the collision's object
 */

  double _getInnerProduct(Vector2 collision, Force forceDirection) {
    Vector2 appliedPressure;

    switch (forceDirection) {
      case Force.left:
        appliedPressure = Vector2(1, 0);
        break;

      case Force.right:
        appliedPressure = Vector2(-1, 0);
        break;

      case Force.down:
        appliedPressure = Vector2(0, -1);
        break;

      case Force.up:
        appliedPressure = Vector2(0, 1);
        break;
    }

    return appliedPressure.dot(collision);
  }
}
