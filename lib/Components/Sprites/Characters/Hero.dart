import 'package:flame/collisions.dart';

import 'package:flame/components.dart';

import 'Character.dart';
import 'Enemy.dart';

import '../Lasers/Laser.dart';
import '../Lasers/RedLaser.dart';

import '../../Game/EyeGame.dart';

import '../../Collisions/Bodies/ContactBody.dart';

import '../../../Models/Enums/Status.dart';

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

  List<Laser> _lasers = [];

  int _semaphore = 0;

  @override
  void shoot({bool shootRight = true}) {
    RedLaser heroLaser = RedLaser(
        startPosition: Vector2(
            this.body.position.x - (300 - (this.size.x / 2 + 5)),
            this.body.position.y + (this.size.y / 4)));

    if (!shootRight) {
      print("Value of semaphore: $_semaphore");

      if (_semaphore == 0) {
        this.flipHorizontallyAroundCenter();
        _semaphore += 1;
      }

      heroLaser.position.x -= this.size.x * 2;

      heroLaser.velocity.x *= -1;
    } else {
      if (_semaphore == 1) {
        _semaphore = 0;

        this.flipHorizontallyAroundCenter();
      }
    }

    _lasers.add(heroLaser);
  }

  @override
  void handleEnemyCollision(Enemy enemy) {
    // TODO: implement handleEnemyCollision
    super.handleEnemyCollision(enemy);

    if (this.current == Status.roll) {
      enemy.hurting();
    }
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    if (_lasers.isNotEmpty) {
      (gameRef as EyeGame)
          .level
          .addAll(_lasers.map((laser) => laser.contactBody));
      _lasers.clear();
    }
  }
}
