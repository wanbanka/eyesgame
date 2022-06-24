import 'Platform.dart';

import '../../Models/CharFrame.dart';

/**
 * Features of a motionless platform
 */

class FixedPlatform extends Platform {
  FixedPlatform({required this.spritePlatform})
      : super(spritePlatform: spritePlatform);

  CharFrame spritePlatform;
}
