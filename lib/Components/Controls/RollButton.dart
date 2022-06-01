import 'OnePressButton.dart';

import '../Sprites/Characters/Character.dart';

import 'package:flame/components.dart' show Sprite, Vector2;

/**
 * Make a hero's roll
 */

class RollButton extends OnePressButton {
  RollButton(
      {required this.buttonPressed,
      required this.buttonPressedDown,
      required this.hero,
      position})
      : super(
            buttonPressed: buttonPressed,
            buttonPressedDown: buttonPressedDown,
            position: position ?? Vector2.zero(),
            scale: Vector2.all(0.1));

  Sprite buttonPressed;

  Sprite buttonPressedDown;

  Character hero;

  @override
  void goAction() {
    // TODO: implement goAction

    print("Roll: $current");
  }
}
