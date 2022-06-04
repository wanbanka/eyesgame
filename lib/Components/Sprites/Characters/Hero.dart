import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

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
    this.velocity.y += 10;

    this.velocity.y = this.velocity.y.clamp(-this.jumping.toDouble(), 10);

    if (this.current == Status.move ||
        this.current == Status.roll ||
        this.current == Status.jump) {
      this.velocity.x += this.gravity.x * this.speed;

      this.velocity.x = this.velocity.x.clamp(-10, 10);

      if (this.isOnGround) {
        this.velocity.y -= this.jumping;
        this.isOnGround = false;
      }
    }

    this.position.add(this.velocity * dt);
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

        final separationDistance = (size.x / 2) - collisionNormal.length;

        print(collisionNormal);

        if (separationDistance < 30) {
          this.isOnGround = true;
        }

        this.position.y += collisionNormal.y;
      }
    }

    print(this.position);

    super.onCollision(intersectionPoints, other);
  }
}
