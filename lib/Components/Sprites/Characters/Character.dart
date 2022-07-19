import 'package:eyesgame/Components/Sprites/Characters/Enemy.dart';
import 'package:flame_bloc/flame_bloc.dart';

import 'package:flame/components.dart' show Vector2;

import '../SpriteGame.dart';

import '../../../Blocs/MathBloc.dart';

import '../../../States/Loader/LoadedResponse.dart';

import '../../../Models/Enums/Status.dart';
import '../../../Models/Enums/ResponseType.dart';
import '../../../Models/Enums/Coords.dart';

/**
 * Define all the characteristics of a character
 */

abstract class Character extends SpriteGame
    with FlameBlocReader<MathBloc, LoadedResponse> {
  Character({required spriteSheet, required this.speed})
      : super(spriteSheet: spriteSheet) {
    this.current = Status.profile;
  }

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

  void move(double dt) {
    this.isOnPlatform = this.checkOnPlatform();

    if ([Status.move, Status.roll, Status.jump].contains(this.current)) {
      if ([Status.move, Status.roll].contains(this.current)) {
        this.velocity.x += (this.gravity.normalize() * this.speed);

        this.velocity.x = this.velocity.x.clamp(-800, 800);

        this.contactBody!.body.applyForce(this.velocity);
      }

      this.jump();
    }
  }

/**
 * Make a character jump
 */

  void jump() {
    if (this.jumping > 0) {
      if (this.isOnGround || this.isOnPlatform) {
        this.velocity.y = -this.jumping.toDouble();

        this.isOnGround = false;

        this.isOnPlatform = false;
      }
    }
  }

/**
 * Make a character shoot a laser
 */

  void shoot({bool shootRight = true});
}
