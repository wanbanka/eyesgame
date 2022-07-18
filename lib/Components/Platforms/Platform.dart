import 'package:flame/components.dart' show Vector2, SpriteComponent, Sprite;

import 'package:flame/flame.dart';

import 'package:flame/collisions.dart';

import '../../Models/CharFrame.dart';

import '../Collisions/Bodies/ContactBody.dart';

/**
 * Defines all features of platforms
 */

abstract class Platform extends SpriteComponent {
  Platform({required this.spritePlatform}) : super() {
    Flame.images.load(spritePlatform.srcImage).then((value) {
      this.sprite = Sprite(value);

      this.size = Vector2(spritePlatform.size, value.height.toDouble());
    });

    _contactBody =
        ContactBody(object: this, isMoving: false, hitbox: RectangleHitbox());
  }

  CharFrame spritePlatform;

  ContactBody? _contactBody;

  ContactBody? get contactBody => this._contactBody;
}
