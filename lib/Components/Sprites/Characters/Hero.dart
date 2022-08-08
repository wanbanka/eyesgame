import 'package:flame/collisions.dart';

import 'package:flame/components.dart';

import 'Character.dart';

import '../Lasers/RedLaser.dart';

import '../../Game/EyeGame.dart';

import '../../Collisions/Bodies/ContactBody.dart';

/**
 * Define all characteristics of the hero
 */

class Hero extends Character {
  Hero({required spriteSheet, required speed, position})
      : super(spriteSheet: spriteSheet, speed: speed) {
    this.position = position ?? Vector2.zero();

    this.contactBody = ContactBody(
        object: this,
        isMoving: true,
        hitbox: RectangleHitbox(position: this.position));
  }

  @override
  void shoot({bool shootRight = true}) {
    this.scale.x = this.scale.x.abs();

    RedLaser heroLaser = RedLaser(
        startPosition: Vector2(this.body.position.x - (300 - this.size.x / 2),
            this.body.position.y + (this.size.y / 4)));

    if (!shootRight) {
      this.scale.x *= -1;

      heroLaser.position.x -= this.size.x * 1.5;
    }

    (gameRef as EyeGame).level.add(heroLaser.contactBody);
  }
}
