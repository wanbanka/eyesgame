import 'package:flame/components.dart'
    show RectangleComponent, Vector2, PositionComponent;

import 'package:flame/collisions.dart';

import 'dart:ui';

import '../../Collisions/CollisionSystem.dart';

/**
 * Define all the features of a laser
 */

abstract class Laser extends RectangleComponent
    with CollisionSystem, CollisionCallbacks {
  Laser(
      {required this.sizeLaser,
      required this.startPosition,
      required this.color,
      required this.damage})
      : super(
            size: sizeLaser,
            position: startPosition,
            paint: Paint()..color = color);

  Vector2 sizeLaser;

  Vector2 startPosition;

  Color color;

  int damage;

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    this.position.add(this.velocity);
  }

  @override
  void handleFloorCollision(Set<Vector2> intersectionPoints) {
    // TODO: implement handleFloorCollision
    super.handleFloorCollision(intersectionPoints);

    if (this.isOnGround) {
      removeFromParent();
    }
  }

  @override
  void handleScreenCollision(Set<Vector2> intersectionPoints) {
    // TODO: implement handleScreenCollision
    super.handleScreenCollision(intersectionPoints);

    if (this.isOnWall) {
      removeFromParent();
    }
  }

  @override
  void handlePlatformCollision(Set<Vector2> intersectionPoints) {
    // TODO: implement handlePlatformCollision
    super.handlePlatformCollision(intersectionPoints);

    removeFromParent();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision

    computeCollision(intersectionPoints, other);

    super.onCollision(intersectionPoints, other);
  }
}
