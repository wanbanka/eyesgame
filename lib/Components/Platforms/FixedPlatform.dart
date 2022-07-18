import 'package:flame/components.dart';

import 'Platform.dart';

import '../../Models/CharFrame.dart';

/**
 * Features of a motionless platform
 */

class FixedPlatform extends Platform {
  FixedPlatform({required this.spritePlatform, position})
      : super(spritePlatform: spritePlatform) {
    this.position = position ?? Vector2.zero();
  }

  CharFrame spritePlatform;
}
