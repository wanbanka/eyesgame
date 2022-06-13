import 'package:flutter/material.dart' as Ma;

import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame/collisions.dart';

import 'dart:ui' show Image;

/**
 * Description of the level's background
 */

class ParallaxBackground extends ParallaxComponent with CollisionCallbacks {
  ParallaxBackground({required this.backgroundImage, required this.floorImage})
      : super(anchor: Anchor.center);

  String backgroundImage;

  String floorImage;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    Image background = await Flame.images.load(backgroundImage);

    Image floor = await Flame.images.load(floorImage);

    this.parallax = Parallax([
      ParallaxLayer(ParallaxImage(background,
          fill: LayerFill.height, alignment: Ma.Alignment.center)),
      ParallaxLayer(ParallaxImage(floor,
          alignment: Ma.Alignment(0.0, 0.75), fill: LayerFill.none))
    ]);

    await add(RectangleHitbox(
        size: Vector2(floor.width.toDouble(), floor.height.toDouble()),
        position: Vector2(0, floor.height / 7))
      ..collisionType = CollisionType.passive);
  }
}
