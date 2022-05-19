import '../SpriteGame.dart';

/**
 * Define all the characteristics of a character
 */

abstract class Character extends SpriteGame {
  Character({required spriteSheet}) : super(spriteSheet: spriteSheet);
}
