import 'package:flame/input.dart' show HudButtonComponent;

import 'package:flame/components.dart' show SpriteComponent, Vector2, Anchor;

/**
 * Move the hero in the level
 */

class MoveButton extends HudButtonComponent {
  MoveButton(
      {required this.buttonPressed,
      required this.buttonPressedDown,
      required this.moveAction,
      position})
      : super(
            position: position ?? Vector2.zero(),
            anchor: Anchor.center,
            scale: Vector2.all(0.15),
            button: buttonPressed,
            buttonDown: buttonPressedDown,
            onPressed: () {
              moveAction();
            });

  Function moveAction;

  SpriteComponent buttonPressed;

  SpriteComponent buttonPressedDown;
}
