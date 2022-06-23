import 'package:flame/components.dart'
    show Component, ScreenHitbox, Vector2, Anchor;
import 'package:flame/experimental.dart' show World, HasTappableComponents;

import 'package:flame_bloc/flame_bloc.dart';

import '../../Blocs/MathBloc.dart';

import '../Sprites/Characters/Character.dart';

import '../Backgrounds/ParallaxBackground.dart';

import '../../States/Loader/LoadedResponse.dart';

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
    List<Component> dataToAdd = [background, hero, ...ennemies];

    await add(FlameMultiBlocProvider(providers: [
      FlameBlocProvider<MathBloc, LoadedResponse>(create: () => MathBloc())
    ], children: dataToAdd));

    await add(ScreenHitbox()..anchor = Anchor.center);
  }
}
