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

    this.position.x -= this.size.x / 0.6;
  }

  @override
  void move(double dt) {
    if (!this.isOnGround) {
      this.velocity.y += this.gravity.y;
    }

    if ([Status.move, Status.roll, Status.jump].contains(this.current)) {
      this.velocity.x += (this.gravity.normalize() * this.speed);

      if (this.jumping > 0) {
        if (this.isOnGround) {
          this.velocity.y = -this.jumping.toDouble();

          this.isOnGround = false;
        }
      }
    } else {
      if (this.velocity.y == 0) {
        this.velocity.x = 0;
      }
    }

    this.bloc.computeTrajectory(gravity.y, velocity.x, velocity.y, dt);

    var state = this.bloc.state;

    if (state.type == ResponseType.success) {
      this.position.add(Vector2(
          state.computedCoords[Coords.x]!, state.computedCoords[Coords.y]!));
    }
  }
}
