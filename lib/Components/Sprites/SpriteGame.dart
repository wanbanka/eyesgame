import 'package:flame/flame.dart';
import 'package:flame/components.dart'
    show
        SpriteAnimationGroupComponent,
        Vector2,
        Anchor,
        PositionComponent,
        HasGameRef;
import 'package:flame/sprite.dart';
import 'package:flame/collisions.dart';

import 'dart:ui' show Image;

import '../../Models/CharFrame.dart';
import '../../Models/ConvertEnumString.dart';
import '../../Models/Enums/Status.dart';

import '../Collisions/CollisionSystem.dart';

import "../Game/EyeGame.dart";

/**
 * Define all the properties of all animated sprites
 */

abstract class SpriteGame extends SpriteAnimationGroupComponent
    with CollisionSystem, CollisionCallbacks, HasGameRef<EyeGame> {
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
 * Check if a character stays on a platform or not
 * 
 * @source https://www.youtube.com/watch?v=udrYX19XOQA
 */

  bool checkOnPlatform() {
    var platforms = gameRef.level.platforms.map<bool>((platform) {
      return ((this.position.y + this.height / 4).ceil() ==
              platform.position.y &&
          (this.position.x < platform.position.x + platform.width &&
              platform.position.x <= this.position.x));
    });

    return platforms.contains(true);
  }

  /**
     * @source https://www.youtube.com/watch?v=mSPalRqZQS8
     */

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision

    computeCollision(intersectionPoints, other);

    super.onCollision(intersectionPoints, other);
  }
}
