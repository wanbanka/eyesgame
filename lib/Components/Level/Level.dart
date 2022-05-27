import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart' show World;

import '../Sprites/SpriteGame.dart';

import '../Backgrounds/ParallaxBackground.dart';

import '../Controls/Joystick.dart';

/**
 * Description of a level
 */

class Level extends World {
  Level({required this.background, required this.hero, required this.ennemies})
      : super();

  SpriteGame hero;

  List<SpriteGame> ennemies;

  ParallaxBackground background;

  late Joystick _joystick;

  @override
  Future<void>? onLoad() async {
    _joystick = Joystick(
        knobSrc: await Flame.images.load("Controls/joystick.png"),
        backgroundSrc:
            await Flame.images.load("Controls/background_joystick.png"));

    List dataToAdd = [background, hero, ...ennemies, _joystick];

    dataToAdd.forEach((sprite) async {
      await add(sprite);
    });
  }

  @override
  void update(double dt) {
    // TODO: implement update

    if (_joystick.direction != JoystickDirection.idle) {
      hero.position.add(_joystick.delta * _joystick.intensity * dt);
      if (_joystick.direction == JoystickDirection.left ||
          _joystick.direction == JoystickDirection.upLeft ||
          _joystick.direction == JoystickDirection.downLeft) {
        hero.scale = -hero.scale;
      }
    }

    super.update(dt);
  }
}
