import 'package:flame/game.dart'
    show FlameGame, Vector2, HasTappables, HasCollisionDetection;

import 'package:flame/experimental.dart' show CameraComponent;

import 'package:flame/components.dart'
    show SpriteComponent, PositionComponent, PositionType;

import 'package:flame/flame.dart';

import 'package:flame/sprite.dart';

import 'package:flame/input.dart';

import '../Controls/MoveButton.dart';
import '../Controls/RollButton.dart';
import '../Controls/JumpButton.dart';

import '../Level/Level.dart';

import '../../Models/Enums/Controls.dart';
import '../../Models/CharFrame.dart';
import '../../Models/ConvertEnumString.dart';

import '../Sprites/Lasers/RedLaser.dart';

/**
 * Initialization of a level
 */

class EyeGame extends FlameGame with HasTappables, HasCollisionDetection {
  EyeGame({required this.level, required this.controls}) : super();

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

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    // TODO: implement onTapUp
    super.onTapDown(pointerId, info);

    var controls = <PositionComponent>[
      ...this.children.query<SpriteButtonComponent>(),
      ...this.children.query<HudButtonComponent>()
    ].map<bool>((PositionComponent control) =>
        control.containsPoint(info.eventPosition.game));

    Vector2 realHeroPos =
        Vector2(level.hero.position.x + 380, level.hero.position.y + 175);

    _shootRight =
        (realHeroPos.x - level.hero.size.x / 2) <= info.eventPosition.game.x;

    if (!controls.contains(true)) {
      level.hero.scale.x = level.hero.scale.x.abs();

      RedLaser heroLaser = RedLaser(startPosition: realHeroPos);

      if (!_shootRight) {
        level.hero.scale.x *= -1;

        realHeroPos.x = level.hero.position.x + (300 - level.hero.size.x);

        heroLaser = RedLaser(startPosition: realHeroPos);

        heroLaser.velocity *= -1;
      }

      add(heroLaser);
    }
  }
}
