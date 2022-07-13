import 'package:flame/components.dart' show Vector2;

import 'package:flame/collisions.dart' show RectangleHitbox, CollisionType;

import "Character.dart";

/**
 * Defines all features of an enemy
 */

class Enemy extends Character {
  Enemy({required spriteSheet, required speed, required Vector2 startPosition})
      : super(spriteSheet: spriteSheet, speed: speed) {
    this.position = startPosition;

    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }

  @override
  void shoot({bool shootRight = true}) {
    // TODO: implement shoot
  }
}
