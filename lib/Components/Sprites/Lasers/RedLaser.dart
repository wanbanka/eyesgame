import 'Laser.dart';

import 'dart:ui';

import 'package:flame/components.dart' show Vector2;

/**
 * Basic hero's laser
 */

class RedLaser extends Laser {
  RedLaser({required startPosition})
      : super(
            color: Color(0xffff0000),
            damage: 20,
            sizeLaser: Vector2(150, 5),
            startPosition: startPosition);

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    this.position.add(this.velocity);
  }
}
