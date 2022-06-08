import 'package:flame/flame.dart';
import 'package:flame/components.dart'
    show SpriteAnimationGroupComponent, Vector2, Anchor, PositionComponent;
import 'package:flame/sprite.dart';
import 'package:flame/collisions.dart';

import 'dart:ui' show Image;

import '../../Components/Backgrounds/ParallaxBackground.dart';

import '../../Models/CharFrame.dart';
import '../../Models/ConvertEnumString.dart';
import '../../Models/Enums/Status.dart';

/**
 * Define all the properties of all animated sprites
 */

abstract class SpriteGame extends SpriteAnimationGroupComponent
    with CollisionCallbacks {
  SpriteGame({required Map<String, CharFrame> spriteSheet})
      : super(animations: {}, scale: Vector2.all(0.5)) {
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

  Vector2 _velocity = Vector2.zero();

  Vector2 get velocity => this._velocity;

  set velocity(Vector2 value) => this._velocity = value;

  Vector2 _gravity = Vector2(1, 9.81);

  Vector2 get gravity => this._gravity;

  set gravity(Vector2 value) => this._gravity = value;

  bool isOnGround = false;

  /**
     * @source https://www.youtube.com/watch?v=mSPalRqZQS8
     */

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision

    if (other is ParallaxBackground) {
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;

        final separationDistance = (size.y / 2) - collisionNormal.length;

        if (separationDistance < 30) {
          this.isOnGround = true;
          this.velocity.y = 0;
        }
      }
    }

    super.onCollision(intersectionPoints, other);
  }
}
