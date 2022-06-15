import 'package:flame_bloc/flame_bloc.dart';

import '../SpriteGame.dart';

import '../../../Blocs/MathBloc.dart';

import '../../../States/Loader/LoadedResponse.dart';

/**
 * Define all the characteristics of a character
 */

abstract class Character extends SpriteGame
    with FlameBlocReader<MathBloc, LoadedResponse> {
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

  void shoot();
}
