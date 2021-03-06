import 'LongPressButton.dart';
import '../Sprites/Characters/Character.dart';
import '../../Models/Enums/Status.dart';
import '../../Models/Enums/Controls.dart';

import 'package:flame/components.dart' show SpriteComponent, Vector2, Anchor;

/**
 * Move the hero in the level
 */

class MoveButton extends LongPressButton {
  MoveButton(
      {required this.buttonPressed,
      required this.buttonPressedDown,
      required this.hero,
      required this.direction,
      position})
      : super(
            position: position ?? Vector2.zero(),
            scale: Vector2.all(direction == Controls.right ? 0.15 : -0.15),
            buttonPressed: buttonPressed,
            buttonPressedDown: buttonPressedDown);

  SpriteComponent buttonPressed;

  SpriteComponent buttonPressedDown;

  Character hero;

  Controls direction;

  @override
  void goAction() {
    // TODO: implement goAction

    if (hero.current != Status.roll) {
      hero.current = Status.move;
    }

    if (direction == Controls.right) {
      hero.speed = hero.speed.abs();

      if (hero.scale.x < 0) {
        hero.flipHorizontallyAroundCenter();
      }
    } else if (direction == Controls.left) {
      hero.speed = -hero.speed.abs();

      if (hero.scale.x >= 0) {
        hero.flipHorizontallyAroundCenter();
      }
    }
  }

  @override
  void endAction() {
    if (hero.current != Status.roll) {
      hero.current = Status.profile;
    }
  }
}
