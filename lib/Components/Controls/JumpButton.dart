import "OnePressButton.dart";
import '../Sprites/Characters/Character.dart';
import '../../Models/Enums/Status.dart';

import 'package:flame/components.dart' show Sprite, Vector2;

/**
 * Button used for jumping the hero
 */

class JumpButton extends OnePressButton {
  JumpButton(
      {required this.buttonPressed,
      required this.buttonPressedDown,
      required this.hero,
      position})
      : super(
            buttonPressed: buttonPressed,
            buttonPressedDown: buttonPressedDown,
            position: position ?? Vector2.zero());

  Sprite buttonPressed;

  Sprite buttonPressedDown;

  Character hero;

  @override
  void goAction() {
    var previousState = hero.current;

    if (hero.current != Status.roll) {
      hero.current = Status.jump;
    }

    hero.jumping = 18;

    Future.delayed(Duration(milliseconds: 500), () {
      hero.jumping = 0;

      hero.stop();

      if (hero.current != Status.roll) {
        hero.current = previousState;
      }
    });
  }
}
