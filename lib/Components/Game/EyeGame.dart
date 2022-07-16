import 'package:flame/game.dart'
    show FlameGame, Vector2, HasTappables, HasCollisionDetection;

import 'package:flame/experimental.dart' show CameraComponent;

import 'package:flame/components.dart'
    show SpriteComponent, PositionComponent, Anchor, PositionType;

import 'package:flame/flame.dart';

import 'package:flame/sprite.dart';

import 'package:flame/input.dart';

import 'package:flame_forge2d/flame_forge2d.dart';

import '../Controls/MoveButton.dart';
import '../Controls/RollButton.dart';
import '../Controls/JumpButton.dart';

import '../Level/Level.dart';

import '../../Models/Enums/Controls.dart';
import '../../Models/CharFrame.dart';
import '../../Models/ConvertEnumString.dart';

/**
 * Initialization of a level
 */

class EyeGame extends Forge2DGame with HasTappables, HasCollisionDetection {
  EyeGame({required this.level, required this.controls}) : super(zoom: 1.0);

  Level level;

  Map<String, CharFrame> controls;

  bool _shootRight = false;

  void set shootRight(bool isRight) {
    _shootRight = isRight;
  }

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

      if (control == Controls.left || control == Controls.right) {
        await add(MoveButton(
            position: Vector2(value.posX, value.posY),
            buttonPressed:
                SpriteComponent(sprite: spriteSheet.getSpriteById(0)),
            buttonPressedDown:
                SpriteComponent(sprite: spriteSheet.getSpriteById(1)),
            hero: level.hero,
            direction: control as Controls));
      } else if (control == Controls.roll) {
        await add(RollButton(
            position: Vector2(value.posX, value.posY),
            buttonPressed: spriteSheet.getSpriteById(0),
            buttonPressedDown: spriteSheet.getSpriteById(1),
            hero: level.hero));
      } else if (control == Controls.jump) {
        await add(JumpButton(
            position: Vector2(value.posX, value.posY),
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
   * Compute the real position of the hero
   * (because the frame of reference for positionning isn't
   * the game, but the level)
   */

  Vector2 _computeRealHeroPosition() {
    return Vector2(level.hero.position.x + (380 - (level.hero.size.x / 2)),
        level.hero.position.y);
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

    Vector2 realHeroPos = _computeRealHeroPosition();

    _shootRight = realHeroPos.x <= info.eventPosition.game.x;

    if (!_isControls(info.eventPosition.game)) {
      level.hero.shoot(shootRight: _shootRight);
    }
  }
}
