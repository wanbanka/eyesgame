import 'package:flame/components.dart';

import 'Character.dart';

import '../../../Models/Enums/Status.dart';

/**
 * Define all characteristics of the hero
 */

class Hero extends Character {
  Hero({required spriteSheet, required speed})
      : super(spriteSheet: spriteSheet, speed: speed) {
    this.current = Status.profile;
  }

  @override
  void move(double dt) {
    if (this.current == Status.move || this.current == Status.roll) {
      this.velocity
        ..add(this.gravity.normalized() * this.speed.toDouble() * dt)
        ..clampScalar(-10, 10);

      this.position.add(this.velocity);
    } else {
      this.velocity = Vector2.zero();
    }
  }
}
