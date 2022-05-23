import 'package:flame/experimental.dart' show World;

import '../Sprites/SpriteGame.dart';

/**
 * Description of a level
 */

class Level extends World {
  Level({required this.hero, required this.ennemies}) : super();

  SpriteGame hero;

  List<SpriteGame> ennemies;

  @override
  Future<void>? onLoad() {
    List dataToAdd = [hero, ...ennemies];

    dataToAdd.forEach((sprite) async {
      await add(sprite);
    });
  }
}
