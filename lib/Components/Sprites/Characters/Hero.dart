import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import 'dart:math';

import 'Character.dart';
import '../../Backgrounds/ParallaxBackground.dart';

import '../../../Models/Enums/Status.dart';

/**
 * Define all characteristics of the hero
 */

class Hero extends Character with CollisionCallbacks {
  Hero({required spriteSheet, required speed})
      : super(spriteSheet: spriteSheet, speed: speed) {
    this.current = Status.profile;
  }

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    await add(CircleHitbox());

    return super.onLoad();
  }

  @override
  void move(double dt) {
    if (!this.isOnGround) {
      velocity.y += gravity.y;
    }

    if (this.current == Status.move ||
        this.current == Status.roll ||
        this.current == Status.jump) {
      this.velocity.x += (this.gravity.normalize() * this.speed);

      if (this.jumping > 0) {
        this.velocity.y = -this.jumping.toDouble();

        this.isOnGround = false;
      }
    }

    this.position.add(Vector2(
        this.velocity.x * cos(radians(45)) * dt,
        (-0.5 * this.gravity.y * (pow(dt, 2))) +
            (this.velocity.y * sin(radians(45)) * dt)));
  }

  /**
     * @source https://www.youtube.com/watch?v=mSPalRqZQS8
     */

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision

    if (other is ParallaxBackground) {
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;

        final separationDistance = (size.y / 2) - collisionNormal.length;

        if (separationDistance < 30) {
          this.isOnGround = true;
          this.velocity.y = 0;
        }
      }
    }

    super.onCollision(intersectionPoints, other);
  }
}
