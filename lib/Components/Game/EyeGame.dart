import 'package:flame/game.dart' show FlameGame;

import 'package:flame/experimental.dart' show CameraComponent;

/**
 * Initialization of a level
 */

class EyeGame extends FlameGame {
  EyeGame({required this.level}) : super();

  dynamic level;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    await add(CameraComponent(world: level)..add(level));

    debugMode = true;
  }
}
