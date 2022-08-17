import 'package:flame/components.dart';

import 'Laser.dart';

import '../Characters/Hero.dart';

import '../Characters/Enemy.dart';

/**
 * Define all the features of the enemy's laser
 */

abstract class EnemyLaser extends Laser {
  EnemyLaser(
      {required sizeLaser,
      required startPosition,
      required color,
      required damage})
      : super(
            sizeLaser: sizeLaser,
            startPosition: startPosition,
            color: color,
            damage: damage);

  @override
  void handleHeroCollision(Hero hero) {
    // TODO: implement handleHeroCollision
    hero.hurting();
  }

  @override
  void handleEnemyCollision(Enemy enemy) {
    // TODO: implement handleEnemyCollision
    enemy.velocity = Vector2.zero();
  }
}
