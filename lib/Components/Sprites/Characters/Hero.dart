import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import 'Character.dart';

import '../../../Models/Enums/Status.dart';
import '../../../Models/Enums/ResponseType.dart';
import '../../../Models/Enums/Coords.dart';

/**
 * Define all characteristics of the hero
 */

class Hero extends Character {
  Hero({required spriteSheet, required speed})
      : super(spriteSheet: spriteSheet, speed: speed) {
    this.current = Status.profile;

    add(CircleHitbox());
  }

  @override
  void onGameResize(Vector2 size) {
    // TODO: implement onGameResize
    super.onGameResize(size);

    this.position.x -= this.size.x / 0.7;
  }

  @override
  void move(double dt) {
    if (!this.isOnGround) {
      this.velocity.y += this.gravity.y;
    }

    if ([Status.move, Status.roll, Status.jump].contains(this.current)) {
      if ([Status.move, Status.roll].contains(this.current)) {
        this.velocity.x += (this.gravity.normalize() * this.speed);

        this.velocity.x = this.velocity.x.clamp(-800, 800);
      }

      this.jump();
    } else {
      if (this.velocity.y == 0) {
        this.velocity = Vector2.zero();
      }
    }

    this.bloc.computeTrajectory(gravity.y, [velocity.x, velocity.y], dt,
        isOnWall: this.isOnWall, touchedWalls: this.touchedWalls);

    if (this.bloc.state.type == ResponseType.success) {
      this.position.add(Vector2.array([
            this.bloc.state.computedCoords[Coords.x]!,
            this.bloc.state.computedCoords[Coords.y]!
          ]));
    }
  }

  @override
  void jump() {
    // TODO: implement jump

    if (this.jumping > 0) {
      if (this.isOnGround) {
        this.velocity.y = -this.jumping.toDouble();

        this.isOnGround = false;
      }
    }
  }
}
