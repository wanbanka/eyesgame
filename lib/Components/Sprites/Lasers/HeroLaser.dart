import 'package:flame/components.dart';

import 'Laser.dart';

import '../Characters/Enemy.dart';
import '../Characters/Hero.dart';
/**
 * Define all the features of the hero's laser
 */

abstract class HeroLaser extends Laser {
  HeroLaser(
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
  void handleEnemyCollision(Enemy enemy) {
    // TODO: implement handleEnemyCollision
    super.handleEnemyCollision(enemy);

    enemy.hurting();
  }

  @override
  void handleHeroCollision(Hero hero) {
    // TODO: implement handleHeroCollision

    hero.velocity = Vector2.zero();
  }
}
