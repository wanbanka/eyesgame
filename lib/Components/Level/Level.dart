import 'package:flame/components.dart'
    show Component, ScreenHitbox, Vector2, Anchor;
import 'package:flame/experimental.dart' show World, HasTappableComponents;

import 'package:flame_bloc/flame_bloc.dart';

import '../../Blocs/MathBloc.dart';

import '../Sprites/Characters/Character.dart';

import '../Backgrounds/ParallaxBackground.dart';

import '../Platforms/Platform.dart';
import '../Platforms/FixedPlatform.dart';

import '../../Models/CharFrame.dart';

import '../../States/Loader/LoadedResponse.dart';

/**
 * Description of a level
 */

class Level extends World {
  Level(
      {required this.background,
      required this.hero,
      required this.ennemies,
      required List<CharFrame> platforms})
      : super() {
    platforms.forEach((platform) {
      Platform? platformToAdd;

      switch (platform.type) {
        case "fixed":
          platformToAdd = FixedPlatform(spritePlatform: platform);
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

    List<Component> dataToAdd = [background, hero, ...ennemies, ...platforms];

    await add(FlameMultiBlocProvider(providers: [
      FlameBlocProvider<MathBloc, LoadedResponse>(create: () => MathBloc())
    ], children: dataToAdd));

    await add(ScreenHitbox()..anchor = Anchor.center);
  }
}
