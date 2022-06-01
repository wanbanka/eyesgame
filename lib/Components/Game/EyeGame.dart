import 'package:flame/game.dart'
    show FlameGame, Vector2, HasDraggables, HasTappables;

import 'package:flame/experimental.dart' show CameraComponent;

import 'package:flame/components.dart' show SpriteComponent, Component;

import 'package:flame/flame.dart';

import 'package:flame/sprite.dart';

import '../Controls/MoveButton.dart';

import '../Level/Level.dart';

import '../../Models/Enums/Controls.dart';
import '../../Models/Enums/Status.dart';
import '../../Models/CharFrame.dart';
import '../../Models/ConvertEnumString.dart';

/**
 * Initialization of a level
 */

class EyeGame extends FlameGame with HasDraggables, HasTappables {
  EyeGame({required this.level, required this.controls}) : super();

  Level level;

  Map<String, CharFrame> controls;

  /**
   * Load player's controls in order to interact with the game
   */

  Future<void> _loadControls() async {
    controls.forEach((key, value) async {
      var control = ConvertEnumString.getEnumFromString(Controls.values, key);

      var spriteSheet = SpriteSheet.fromColumnsAndRows(
          image: await Flame.images.load(value.srcImage),
          columns: value.nbSprites,
          rows: 1);

      switch (control) {
        case Controls.right:
          await add(MoveButton(
              position: Vector2(value.posX, value.posY),
              buttonPressed:
                  SpriteComponent(sprite: spriteSheet.getSpriteById(0)),
              buttonPressedDown:
                  SpriteComponent(sprite: spriteSheet.getSpriteById(1)),
              moveAction: () {
                level.hero.current = Status.move;
                level.hero.gravity.x = 1;

                if (level.hero.scale.x < 0) {
                  level.hero.flipHorizontallyAroundCenter();
                }
              },
              endAction: () {
                level.hero.current = Status.profile;
              }));

          break;

        case Controls.left:
          await add(MoveButton(
              scale: Vector2(-0.15, 0.15),
              position: Vector2(value.posX, value.posY),
              buttonPressed:
                  SpriteComponent(sprite: spriteSheet.getSpriteById(0)),
              buttonPressedDown:
                  SpriteComponent(sprite: spriteSheet.getSpriteById(1)),
              moveAction: () {
                level.hero.current = Status.move;
                level.hero.gravity.x = -1;

                if (level.hero.scale.x >= 0) {
                  level.hero.flipHorizontallyAroundCenter();
                }
              },
              endAction: () {
                level.hero.current = Status.profile;
              }));

          break;

        default:
      }
    });
  }

  @override
  Future<void>? onLoad() async {
    // TODO: implement onLoad

    var cameraToAdd = CameraComponent(world: level);

    await add(cameraToAdd..add(cameraToAdd.world));

    await _loadControls();

    debugMode = true;
  }
}
