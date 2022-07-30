import 'package:flame/components.dart' show RectangleComponent, Vector2;

import 'dart:ui';

import '../../Collisions/Systems/CollisionSystem.dart';
import '../../Collisions/Bodies/ContactBody.dart';

import '../../Platforms/Platform.dart';

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

  ContactBody? _contactBody;

  ContactBody? get contactBody => this._contactBody;

  set contactBody(ContactBody? value) => this._contactBody = value;
}
