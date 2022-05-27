import 'package:flame/components.dart'
    show JoystickComponent, SpriteComponent, Vector2, Anchor;

import 'package:flame/input.dart';

import 'dart:ui' show Image;

/**
 * Represents the joystick in order to move the hero
 */

class Joystick extends JoystickComponent {
  Joystick({required this.knobSrc, required this.backgroundSrc})
      : super(
          knob: SpriteComponent.fromImage(knobSrc, anchor: Anchor.center),
          background: SpriteComponent.fromImage(
            backgroundSrc,
          ),
          position: Vector2.zero(),
        );

  Image knobSrc;

  Image backgroundSrc;

  @override
  void onGameResize(Vector2 gameSize) {
    // TODO: implement onGameResize

    super.onGameResize(gameSize);

    position = Vector2(0, gameSize.y / 2);
  }
}
