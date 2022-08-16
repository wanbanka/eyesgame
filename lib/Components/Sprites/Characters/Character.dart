import 'package:flame_bloc/flame_bloc.dart';

import 'package:flame/components.dart' show Vector2;

import '../SpriteGame.dart';

import '../../../States/Loader/LoadedResponse.dart';

import '../../../Models/Enums/Status.dart';

import '../../Platforms/Platform.dart';

import '../../Collisions/Systems/CollisionSystem.dart';

/**
 * Define all the characteristics of a character
 */

abstract class Character extends SpriteGame with CollisionSystem {
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

    this.velocity.y = this.velocity.y.clamp(-80, 80);

    if ([Status.move, Status.roll, Status.jump].contains(this.current)) {
      if ([Status.move, Status.roll].contains(this.current)) {
        print("Speed: $speed");

        this.velocity.x +=
            (this.gameRef.world.gravity.normalize() * this.speed);

        this.velocity.x = this.velocity.x.clamp(
            -20 * this.speed.toDouble().abs(),
            20 * this.speed.toDouble().abs());
      }

      this.jump();
    } else {
      this.velocity.x = 0;
    }

    this.run();
  }

  /**
   * Make a character run
   */

  void run() {
    this.body.applyLinearImpulse(this.velocity);
  }

/**
 * Make a character jump
 */

  void jump() {
    if (this.jumping > 0) {
      this.velocity.y = -this.jumping.toDouble();

      this.isAloft = true;

      if (this.velocity.x != 0) {
        this.velocity.y *= 100;
      }
    }
  }

/**
 * Stop any character's move
 */

  void stop() {
    this.body.linearVelocity.scale(0);
    this.body.linearDamping = 10;
  }

/**
 * Handle the animation of injury of the character
 */

  void hurting() {
    this.current = Status.hurt;

    Future.delayed(Duration(milliseconds: 2000), () {
      this.current = Status.profile;
    });
  }

/**
 * Make a character shoot a laser
 */

  void shoot({bool shootRight = true});
}
