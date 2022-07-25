import 'package:flame/collisions.dart';
import 'package:flame/components.dart' show RectangleComponent, Vector2;

import 'dart:ui';

import '../../Collisions/Systems/CollisionSystem.dart';
import '../../Collisions/Bodies/ContactBody.dart';

/**
 * Define all the features of a laser
 */

abstract class Laser extends RectangleComponent with CollisionSystem {
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

  ContactBody? _contactBody;

  ContactBody? get contactBody => this._contactBody;

  set contactBody(ContactBody? value) => this._contactBody = value;

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
  }

  @override
  void handleScreenCollision(Set<Vector2> intersectionPoints) {
    // TODO: implement handleScreenCollision
    super.handleScreenCollision(intersectionPoints);
  }

  @override
  void handlePlatformCollision(Set<Vector2> intersectionPoints) {
    // TODO: implement handlePlatformCollision
    super.handlePlatformCollision(intersectionPoints);

    removeFromParent();
  }
}
