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

  Vector2 _velocity = Vector2.zero();

  Vector2 get velocity => this._velocity;

  set velocity(Vector2 value) => this._velocity = value;

  Vector2 _gravity = Vector2(1, 9.81);

  Vector2 get gravity => this._gravity;

  set gravity(Vector2 value) => this._gravity = value;

  bool isOnGround = false;

  bool isOnWall = false;

  int touchedWalls = 0;

  /**
     * @source https://www.youtube.com/watch?v=mSPalRqZQS8
     */

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision

    if (intersectionPoints.length == 2) {
      if (other is ParallaxBackground) {
        _handleFloorCollision(intersectionPoints);
      } else if (other is ScreenHitbox) {
        _handleScreenCollision(intersectionPoints);
      }
    }

    super.onCollision(intersectionPoints, other);
  }

  /**
   * Handle the collision with the screen's boundaries
   */

  void _handleScreenCollision(Set<Vector2> intersectionPoints) {
    final mid =
        (intersectionPoints.elementAt(0) + intersectionPoints.elementAt(1)) / 2;

    final collisionNormal = absoluteCenter - mid;

    final separationDistance = (size.x / 2) - collisionNormal.length;

    double innerLeft = Vector2(1, 0).dot(collisionNormal.normalized());

    double innerRight = Vector2(-1, 0).dot(collisionNormal.normalized());

    print("Inners: $innerLeft, $innerRight");

    if (innerLeft > 0.9 || innerRight > 0.9) {
      this.isOnWall = true;
      this.touchedWalls += 1;
      this.isOnGround = false;
    }

    position -= collisionNormal.normalized().scaled(
        innerLeft > 0.9 ? -innerLeft : (innerRight > 0.9 ? -innerRight : 0));
  }

  /**
   * Handle the collision with the floor and the platforms
   */

  void _handleFloorCollision(Set<Vector2> intersectionPoints) {
    final mid =
        (intersectionPoints.elementAt(0) + intersectionPoints.elementAt(1)) / 2;

    final collisionNormal = absoluteCenter - mid;

    double inner = Vector2(0, -1).dot(collisionNormal.normalized());

    if (inner > 0.9) {
      this.isOnGround = true;
      this.isOnWall = false;
      this.touchedWalls = 0;
      this.velocity = Vector2.zero();
    }

    position += collisionNormal.normalized().scaled(inner);
  }
}
