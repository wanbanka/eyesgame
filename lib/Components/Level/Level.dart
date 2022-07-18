import 'package:flame/components.dart'
    show Component, ScreenHitbox, Anchor, Vector2;
import 'package:flame/experimental.dart' show World;

import 'package:flame_bloc/flame_bloc.dart';

import '../../Blocs/MathBloc.dart';

import '../Sprites/Characters/Character.dart';

import '../Backgrounds/ParallaxBackground.dart';

import '../Platforms/Platform.dart';
import '../Platforms/FixedPlatform.dart';

import '../../Models/Properties.dart';

import '../../States/Loader/LoadedResponse.dart';

/**
 * Description of a level
 */

class Level extends World {
  Level(
      {required this.background,
      required this.hero,
      required this.ennemies,
      required List<Properties> platforms})
      : super() {
    platforms.forEach((platformSelected) {
      Platform? platformToAdd;

      switch (platformSelected.platform!.type) {
        case "fixed":
          platformToAdd = FixedPlatform(
              spritePlatform: platformSelected.platform!,
              position: Vector2(platformSelected.posX, platformSelected.posY));
          break;
        default:
      }

      this.platforms.add(platformToAdd!);
    });
  }

  Character hero;

  List<Character> ennemies = [];

  List<Platform> platforms = [];

  ParallaxBackground background;

  @override
  Future<void>? onLoad() async {
    print("List of enemies: $ennemies");

    List<Component> dataToAdd = [
      background.contactBody!,
      hero.contactBody!,
      ...(ennemies.map((enemy) => enemy.contactBody!).toList()),
      ...(platforms.map((platform) => platform.contactBody!).toList())
    ];

    await add(FlameMultiBlocProvider(providers: [
      FlameBlocProvider<MathBloc, LoadedResponse>(create: () => MathBloc())
    ], children: dataToAdd));

    await add(ScreenHitbox()..anchor = Anchor.center);
  }
}
