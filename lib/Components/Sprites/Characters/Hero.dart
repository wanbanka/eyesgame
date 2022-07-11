import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import 'Character.dart';

import '../Lasers/RedLaser.dart';

/**
 * Define all characteristics of the hero
 */

class Hero extends Character {
  Hero({required spriteSheet, required speed})
      : super(spriteSheet: spriteSheet, speed: speed) {
    add(CircleHitbox());
  }

  @override
  void onGameResize(Vector2 size) {
    // TODO: implement onGameResize
    super.onGameResize(size);

    this.position.x -= this.size.x / 0.7;
  }

  @override
  void shoot({bool shootRight = true}) {
    this.scale.x = this.scale.x.abs();

    RedLaser heroLaser = RedLaser(startPosition: this.position);

    if (!shootRight) {
      this.scale.x *= -1;

      heroLaser.position.x -= this.size.x * 1.5;

      heroLaser.velocity.x *= -1;
    }

    gameRef.level.add(heroLaser);
  }
}
