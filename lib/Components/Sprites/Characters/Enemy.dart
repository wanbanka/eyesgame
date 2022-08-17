import 'package:flame/components.dart' show Vector2;

import 'package:flame/collisions.dart' show RectangleHitbox;

import "Character.dart";

import 'Hero.dart';

import "../../Collisions/Bodies/ContactBody.dart";

import '../../../Models/Enums/Status.dart';

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

  @override
  void handleHeroCollision(Hero hero) {
    // TODO: implement handleHeroCollision
    super.handleHeroCollision(hero);

    if (hero.current != Status.roll) {
      hero.hurting();
    }
  }
}
