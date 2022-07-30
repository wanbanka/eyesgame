import 'package:flame_bloc/flame_bloc.dart';

import 'package:flame/components.dart' show Vector2;

import '../SpriteGame.dart';

import '../../../Blocs/MathBloc.dart';

import '../../../States/Loader/LoadedResponse.dart';

import '../../../Models/Enums/Status.dart';

import '../../Platforms/Platform.dart';

import '../../Collisions/Systems/CollisionSystem.dart';

/**
 * Define all the characteristics of a character
 */

abstract class Character extends SpriteGame
    with CollisionSystem, FlameBlocReader<MathBloc, LoadedResponse> {
  Character({required spriteSheet, required this.speed})
      : super(spriteSheet: spriteSheet) {
    this.current = Status.profile;
  }

  int speed;

  int jumping = 0;

  @override
  void handlePlatformCollision(Platform platform) {
    // TODO: implement handlePlatformCollision
    super.handlePlatformCollision(platform);

    this.jumping = 0;
  }

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
    this.velocity.y += this.gameRef.world.gravity.y;

    this.velocity.y = this.velocity.y.clamp(-800, 800);

    if ([Status.move, Status.roll, Status.jump].contains(this.current)) {
      if ([Status.move, Status.roll].contains(this.current)) {
        print("Speed: $speed");

        this.velocity.x +=
            (this.gameRef.world.gravity.normalize() * this.speed);

        this.velocity.x = this.velocity.x.clamp(-1200, 1200);
      }

      this.jump();
    } else {
      this.velocity.x = 0;
    }

    this.contactBody!.body.applyLinearImpulse(
        this.velocity * (this.contactBody!.body.mass * 100));
  }

/**
 * Make a character jump
 */

  void jump() {
    if (this.jumping > 0) {
      this.velocity.y = -this.jumping.toDouble();

      if (this.velocity.x != 0) {
        this.velocity.y *= 100;
      }
    }
  }

/**
 * Stop any character's move
 */

  void stop() {
    this.contactBody!.body.linearVelocity.scale(0);
  }

/**
 * Make a character shoot a laser
 */

  void shoot({bool shootRight = true});
}
