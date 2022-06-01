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
            button: buttonPressed,
            buttonDown: buttonPressedDown,
            scale: scale ?? Vector2.all(0.15),
            anchor: Anchor.center,
            size: Vector2.all(buttonPressed.image.width.toDouble()));

  Sprite buttonPressed;

  Sprite buttonPressedDown;

/**
 * Action when button is pressed
 */

  void goAction();

  @override
  Future<void>? onLoad() {
    // TODO: implement onLoad

    this.onPressed = goAction;

    return super.onLoad();
  }
}
