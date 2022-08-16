import 'Laser.dart';

import 'dart:ui';

import 'package:flame/components.dart' show Vector2;

import 'package:flame/collisions.dart';

import '../../Collisions/Bodies/ContactBody.dart';

/**
 * Basic hero's laser
 */

class RedLaser extends Laser {
  RedLaser({required startPosition})
      : super(
            color: Color(0xffff0000),
            damage: 20,
            sizeLaser: Vector2(150, 5),
            startPosition: startPosition) {
    this.contactBody =
        ContactBody(object: this, isMoving: true, hitbox: RectangleHitbox());

    this.velocity = Vector2(25, 0);
  }
}
