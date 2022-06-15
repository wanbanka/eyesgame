import 'package:flame/components.dart' show RectangleComponent, Vector2, Anchor;

import 'dart:ui';

/**
 * Define all the features of a laser
 */

abstract class Laser extends RectangleComponent {
  Laser(
      {required this.sizeLaser,
      required this.startPosition,
      required this.color,
      required this.damage})
      : super(
            size: sizeLaser,
            position: startPosition,
            paint: Paint()..color = color);

  Vector2 sizeLaser;

  Vector2 startPosition;

  Color color;

  int damage;
}
