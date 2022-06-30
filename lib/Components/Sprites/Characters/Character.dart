import 'package:flame_bloc/flame_bloc.dart';

import 'package:flame/components.dart';

import '../SpriteGame.dart';

import '../../../Blocs/MathBloc.dart';

import '../../../States/Loader/LoadedResponse.dart';

import '../../Game/EyeGame.dart';

/**
 * Define all the characteristics of a character
 */

abstract class Character extends SpriteGame
    with FlameBlocReader<MathBloc, LoadedResponse>, HasGameRef<EyeGame> {
  Character({required spriteSheet, required this.speed})
      : super(spriteSheet: spriteSheet);

  int speed;

  int jumping = 0;

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    this.move(dt);
  }

  /**
   * Move a character according to its state
   */

  void move(double dt);

/**
 * Make a character jump
 */

  void jump();

/**
 * Make a character shoot a laser
 */

  void shoot({bool shootRight = true});

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
}
