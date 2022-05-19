import 'package:flame/experimental.dart' show World;

import '../Sprites/SpriteGame.dart';

/**
 * Description of a level
 */

class Level extends World {
  Level({required this.sprites}) : super();

  List<SpriteGame> sprites;

  @override
  Future<void>? onLoad() {
    this.sprites.forEach((sprite) async {
      await add(sprite);
    });
  }
}
