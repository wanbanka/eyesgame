import 'package:flame/game.dart'
    show FlameGame, Vector2, HasTappables, HasCollisionDetection;

import 'package:flame/experimental.dart' show CameraComponent;

import 'package:flame/components.dart' show SpriteComponent, PositionComponent;

import 'package:flame/flame.dart';

import 'package:flame/sprite.dart';

import 'package:flame/input.dart';

import 'package:flame_forge2d/flame_forge2d.dart';

import '../Controls/MoveButton.dart';
import '../Controls/RollButton.dart';
import '../Controls/JumpButton.dart';

import '../Level/Level.dart';

import '../../Models/Enums/Controls.dart';
import '../../Models/Properties.dart';
import '../../Models/ConvertEnumString.dart';

/**
 * Initialization of a level
 */

class EyeGame extends Forge2DGame with HasTappables, HasCollisionDetection {
  EyeGame({required this.level, required this.controls})
      : super(zoom: 1.0, gravity: Vector2(0, 50));

  Level level;

  List<Properties> controls;

  bool _shootRight = false;

  void set shootRight(bool isRight) {
    _shootRight = isRight;
  }

  /**
   * Load player's controls in order to interact with the game
   */

  Future<void> _loadControls() async {
    controls.forEach((controlAdd) async {
      var intermediateControl = controlAdd.control!;

      var controlCheck = ConvertEnumString.getEnumFromString(
          Controls.values, intermediateControl.type);

      var spriteSheet = SpriteSheet.fromColumnsAndRows(
          image: await Flame.images.load(intermediateControl.srcImage),
          columns: intermediateControl.nbSprites,
          rows: 1);

      if (controlCheck == Controls.left || controlCheck == Controls.right) {
        await add(MoveButton(
            position: Vector2(controlAdd.posX, controlAdd.posY),
            buttonPressed:
                SpriteComponent(sprite: spriteSheet.getSpriteById(0)),
            buttonPressedDown:
                SpriteComponent(sprite: spriteSheet.getSpriteById(1)),
            hero: level.hero,
            direction: controlCheck as Controls));
      } else if (controlCheck == Controls.roll) {
        await add(RollButton(
            position: Vector2(controlAdd.posX, controlAdd.posY),
            buttonPressed: spriteSheet.getSpriteById(0),
            buttonPressedDown: spriteSheet.getSpriteById(1),
            hero: level.hero));
      } else if (controlCheck == Controls.jump) {
        await add(JumpButton(
            position: Vector2(controlAdd.posX, controlAdd.posY),
            buttonPressed: spriteSheet.getSpriteById(0),
            buttonPressedDown: spriteSheet.getSpriteById(1),
            hero: level.hero));
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

  /**
   * Check if the player touches the controls
   */

  bool _isControls(Vector2 tapPosition) {
    var controls = <PositionComponent>[
      ...this.children.query<SpriteButtonComponent>(),
      ...this.children.query<HudButtonComponent>()
    ].map<bool>(
        (PositionComponent control) => control.containsPoint(tapPosition));

    return controls.contains(true);
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    // TODO: implement onTapUp
    super.onTapDown(pointerId, info);

    Vector2 realHeroPos = level.hero.body.position;

    _shootRight = realHeroPos.x <= info.eventPosition.game.x;

    print("Is it on right ? : $_shootRight");

    if (!_isControls(info.eventPosition.game)) {
      level.hero.shoot(shootRight: _shootRight);
    }
  }
}
