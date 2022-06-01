import 'package:flame/components.dart' show Vector2;
import '../SpriteGame.dart';

/**
 * Define all the characteristics of a character
 */

abstract class Character extends SpriteGame {
  Character({required spriteSheet, required this.speed})
      : super(spriteSheet: spriteSheet);

  int speed;

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    this.move(dt);
  }

  /**
   * Move a character according to its state
   */

  void move(double dt);
}
