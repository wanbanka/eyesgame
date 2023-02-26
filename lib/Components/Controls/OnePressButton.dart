import 'package:flame/input.dart' show SpriteButtonComponent;

import 'package:flame/components.dart' show Sprite, Vector2, Anchor;

/**
 * Represent the globalization of one-press buttons
 */

abstract class OnePressButton extends SpriteButtonComponent {
  OnePressButton(
      {required this.buttonPressed,
      required this.buttonPressedDown,
      position,
      scale})
      : super(
            position: position ?? Vector2.zero(),
            scale: scale ?? Vector2.all(0.15),
            anchor: Anchor.center,
            button: buttonPressed,
            buttonDown: buttonPressedDown,
            size: Vector2.all(buttonPressed.image.width.toDouble() / 2));

  Sprite buttonPressed;

  Sprite buttonPressedDown;

/**
 * Action when button is pressed
 */

  void goAction();

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    this.onPressed = goAction;

    return super.onLoad();
  }
}
