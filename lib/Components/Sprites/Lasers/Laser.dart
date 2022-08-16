import 'package:flame/components.dart'
    show RectangleComponent, Vector2, HasGameRef;

import 'dart:ui';

import '../../Collisions/Systems/CollisionSystem.dart';

import '../../Collisions/Connections/ContactConnect.dart';

import '../../Backgrounds/ParallaxBackground.dart';

import '../../Platforms/Platform.dart';

import '../../Sprites/Characters/Enemy.dart';

/**
 * Define all the features of a laser
 */

abstract class Laser extends RectangleComponent
    with ContactConnect, CollisionSystem, HasGameRef {
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

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    this.body.applyLinearImpulse(this.velocity);
  }

  @override
  void handleBackgroundCollision(ParallaxBackground background) {
    // TODO: implement handleBackgroundCollision
    super.handleBackgroundCollision(background);

    this.destroyBody();
  }

  @override
  void handlePlatformCollision(Platform platform) {
    // TODO: implement handlePlatformCollision
    super.handlePlatformCollision(platform);

    this.destroyBody();
  }

  @override
  void handleEnemyCollision(Enemy enemy) {
    // TODO: implement handleEnemyCollision
    super.handleEnemyCollision(enemy);

    this.destroyBody();
  }
}
