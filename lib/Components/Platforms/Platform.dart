import 'package:flame/components.dart' show Vector2, SpriteComponent, Sprite;

import 'package:flame/flame.dart';

import '../../Models/CharFrame.dart';

/**
 * Defines all features of platforms
 */

abstract class Platform extends SpriteComponent {
  Platform({required this.spritePlatform})
      : super(
            position: Vector2(spritePlatform.posX, spritePlatform.posY),
            size: Vector2.all(spritePlatform.size.toDouble())) {
    Flame.images.load(spritePlatform.srcImage).then((value) {
      this.sprite = Sprite(value);
    });
  }

  CharFrame spritePlatform;
}
