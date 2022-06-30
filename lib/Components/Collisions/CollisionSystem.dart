import 'package:flame/components.dart' show Vector2, PositionComponent;

import 'package:flame/collisions.dart' show ScreenHitbox;

import '../../Models/Enums/Force.dart';

import '../Backgrounds/ParallaxBackground.dart';

import '../Platforms/Platform.dart';

/**
 * System for collision detection and trajectory computing
 * (rebounds, parable...)
 */

mixin CollisionSystem on PositionComponent {
  bool isOnGround = false;

  bool isOnWall = false;

  bool isOnPlatform = false;

  int touchedWalls = 0;

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

    if (innerLeft > 0.9 || innerRight > 0.9) {
      this.isOnWall = true;
      this.touchedWalls += 1;
      this.isOnGround = false;

      this.isOnPlatform = false;
    }

    position -= collisionNormal.scaled(
        innerLeft > 0.9 ? -innerLeft : (innerRight > 0.9 ? -innerRight : 0));
  }

/**
   * Handle the collision with the floor
   */

  void handleFloorCollision(Set<Vector2> intersectionPoints) {
    final collisionNormal = _getNormalCollision(intersectionPoints);

    double inner = _getInnerProduct(collisionNormal, Force.down);

    if (inner > 0.9) {
      this.isOnGround = true;
      this.isOnWall = false;
      this.isOnPlatform = false;

      this.touchedWalls = 0;
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

    print("Inner prod platform: $inner");

    if (inner > 0.79 || inner > -0.25) {
      position += collisionNormal.scaled(inner);

      if (inner > 0.79) {
        this.isOnGround = false;
        this.isOnWall = false;
        this.isOnPlatform = true;

        this.touchedWalls = 0;

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
    if (intersectionPoints.length == 2) {
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
