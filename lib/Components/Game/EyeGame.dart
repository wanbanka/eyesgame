import 'package:flame/components.dart';
import 'package:flame/game.dart' show FlameGame, Vector2, HasDraggables;

import 'package:flame/experimental.dart' show CameraComponent;

/**
 * Initialization of a level
 */

class EyeGame extends FlameGame with HasDraggables {
  EyeGame({required this.level}) : super();

  dynamic level;

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    var cameraToAdd = CameraComponent(world: level);

    await cameraToAdd.add(cameraToAdd.world);

    await add(cameraToAdd);

    debugMode = true;
  }
}
