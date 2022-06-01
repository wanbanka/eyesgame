import 'package:flame/input.dart' show HudButtonComponent;

import 'package:flame/components.dart' show SpriteComponent, Vector2, Anchor;

/**
 * Represent the globalization of long-press buttons
 */

abstract class LongPressButton extends HudButtonComponent {
  LongPressButton(
      {required this.buttonPressed,
      required this.buttonPressedDown,
      position,
      scale})
      : super(
            position: position ?? Vector2.zero(),
            anchor: Anchor.center,
            scale: scale ?? Vector2.all(0.15),
            button: buttonPressed,
            buttonDown: buttonPressedDown);

  SpriteComponent buttonPressed;

  SpriteComponent buttonPressedDown;

/**
 * Action when button is pressed
 */

  void goAction();

  /**
   * Action when button is released
   */

  void endAction();

  @override
  Future<void> onLoad() {
    // TODO: implement onLoad

    this.onPressed = goAction;

    this.onReleased = endAction;

    return super.onLoad();
  }
}
