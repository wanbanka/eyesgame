import 'package:flame/components.dart' show Vector2;
import '../SpriteGame.dart';

/**
 * Define all the characteristics of a character
 */

abstract class Character extends SpriteGame {
  Character({required spriteSheet}) : super(spriteSheet: spriteSheet);

  Vector2 _velocity = Vector2.zero();

  Vector2 get velocity => this._velocity;

  set velocity(Vector2 value) => this._velocity = value;

  Vector2 _gravity = Vector2(1, 0);

  Vector2 get gravity => this._gravity;

  set gravity(Vector2 value) => this._gravity = value;

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);

    this.move();
  }

  void move();
}
