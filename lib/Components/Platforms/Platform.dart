import 'package:flame/components.dart' show Vector2, SpriteComponent, Sprite;

import 'package:flame/flame.dart';

import 'package:flame/collisions.dart';

import '../../Models/CharFrame.dart';

/**
 * Defines all features of platforms
 */

abstract class Platform extends SpriteComponent {
  Platform({required this.spritePlatform})
      : super(
          position: Vector2(spritePlatform.posX, spritePlatform.posY),
        ) {
    Flame.images.load(spritePlatform.srcImage).then((value) {
      this.sprite = Sprite(value);

      this.size = Vector2(spritePlatform.size, value.height.toDouble());
    });

    add(RectangleHitbox()..collisionType = CollisionType.active);
  }

  CharFrame spritePlatform;
}
