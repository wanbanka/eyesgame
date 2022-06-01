import 'package:flame/experimental.dart' show World;

import '../Sprites/Characters/Character.dart';

import '../Backgrounds/ParallaxBackground.dart';

/**
 * Description of a level
 */

class Level extends World {
  Level({required this.background, required this.hero, required this.ennemies})
      : super();

  Character hero;

  List<Character> ennemies;

  ParallaxBackground background;

  @override
  Future<void>? onLoad() async {
    List dataToAdd = [background, hero, ...ennemies];

    dataToAdd.forEach((sprite) async {
      await add(sprite);
    });
  }
}
