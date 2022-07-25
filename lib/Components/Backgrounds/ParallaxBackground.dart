import 'package:flutter/material.dart' as Ma;

import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

import 'dart:ui' show Image;

import '../Collisions/Bodies/ContactBody.dart';

/**
 * Description of the level's background
 */

class ParallaxBackground extends ParallaxComponent {
  ParallaxBackground({required this.backgroundImage, required this.floorImage})
      : super(anchor: Anchor.center) {
    _contactBody =
        ContactBody(object: this, isMoving: false, hitbox: ScreenHitbox());
  }

  String backgroundImage;

  String floorImage;

  ContactBody? _contactBody;

  ContactBody? get contactBody => this._contactBody;

  set contactBody(ContactBody? value) => this._contactBody = value;

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
  }
}
