import 'package:flame/flame.dart';
import 'package:flame/components.dart'
    show SpriteAnimationGroupComponent, Vector2, Anchor, PositionComponent;
import 'package:flame/sprite.dart';
import 'package:flame/collisions.dart';

import 'dart:ui' show Image;

import '../../Models/CharFrame.dart';
import '../../Models/ConvertEnumString.dart';
import '../../Models/Enums/Status.dart';

import '../Collisions/CollisionSystem.dart';

import '../Backgrounds/ParallaxBackground.dart';

import '../Platforms/Platform.dart';

/**
 * Define all the properties of all animated sprites
 */

abstract class SpriteGame extends SpriteAnimationGroupComponent
    with CollisionSystem, CollisionCallbacks {
  SpriteGame({required Map<String, CharFrame> spriteSheet})
      : super(animations: {}, scale: Vector2.all(0.5), anchor: Anchor.center) {
    spriteSheet.forEach((key, charFrame) async {
      var status = ConvertEnumString.getEnumFromString(Status.values, key);

      Image spriteImage = await Flame.images.load(charFrame.srcImage);

      this.size = Vector2((spriteImage.width.toDouble() / charFrame.nbSprites),
          spriteImage.height.toDouble());

      print(this.size);

      this.animations?.addAll({
        status: SpriteAnimation.fromFrameData(
            spriteImage,
            SpriteAnimationData.sequenced(
                amount: charFrame.nbSprites,
                stepTime: charFrame.stepTime,
                textureSize: Vector2(this.size.x, this.size.y)))
      });
    });
  }

  /**
     * @source https://www.youtube.com/watch?v=mSPalRqZQS8
     */

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision

    if (intersectionPoints.length == 2) {
      if (other is ParallaxBackground || other is Platform) {
        handleFloorCollision(intersectionPoints);
      } else if (other is ScreenHitbox) {
        handleScreenCollision(intersectionPoints);
      }
    }

    super.onCollision(intersectionPoints, other);
  }

  Vector2 _gravity = Vector2(1, 9.81);

  Vector2 get gravity => this._gravity;

  set gravity(Vector2 value) => this._gravity = value;
}
