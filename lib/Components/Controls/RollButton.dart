import 'OnePressButton.dart';

import '../Sprites/Characters/Character.dart';

import '../../Models/Enums/Status.dart';

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
        );

  Sprite buttonPressed;

  Sprite buttonPressedDown;

  Character hero;

  @override
  void goAction() {
    // TODO: implement goAction

    if (hero.current != Status.roll) {
      hero.current = Status.roll;
      hero.speed *= 5;
    } else if (hero.current != Status.move) {
      hero.current = Status.profile;
      hero.speed ~/= 5;
    }
  }
}
