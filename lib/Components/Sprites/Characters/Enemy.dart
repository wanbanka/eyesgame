import 'package:flame/components.dart' show Vector2;

import 'package:flame/collisions.dart' show RectangleHitbox;

import "Character.dart";

import "../../Collisions/Bodies/ContactBody.dart";

/**
 * Defines all features of an enemy
 */

class Enemy extends Character {
  Enemy({required spriteSheet, required speed, required Vector2 startPosition})
      : super(spriteSheet: spriteSheet, speed: speed) {
    this.position = startPosition;

    this.contactBody =
        ContactBody(object: this, isMoving: true, hitbox: RectangleHitbox());
  }

  @override
  void shoot({bool shootRight = true}) {
    // TODO: implement shoot
  }
}
