import 'package:flame/flame.dart';
import 'package:flame/components.dart'
    show SpriteAnimationGroupComponent, Vector2, HasGameRef;
import 'package:flame/sprite.dart';

import 'package:flame_forge2d/forge2d_game.dart';

import 'dart:ui' show Image;

import '../../Models/CharFrame.dart';
import '../../Models/ConvertEnumString.dart';
import '../../Models/Enums/Status.dart';

import '../Collisions/Connections/ContactConnect.dart';

/**
 * Define all the properties of all animated sprites
 */

abstract class SpriteGame extends SpriteAnimationGroupComponent
    with HasGameRef<Forge2DGame>, ContactConnect {
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
}
