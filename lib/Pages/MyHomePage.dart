import 'package:flutter/material.dart' hide Hero;

import 'package:flame/components.dart' show Vector2;

import 'package:flame/game.dart' show GameWidget;

import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/LoaderBloc.dart';

import '../States/Loader/LoadedResponse.dart';

import '../Models/Enums/ResponseType.dart';
import '../Models/Enums/DataType.dart';

import '../Events/Loader/LoadingEvent.dart';

import '../Components/Game/EyeGame.dart';
import '../Components/Level/Level.dart';
import '../Components/Sprites/Characters/Hero.dart';
import '../Components/Sprites/Characters/Enemy.dart';
import '../Components/Backgrounds/ParallaxBackground.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<LoaderBloc>().add(LoadingEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: BlocListener<LoaderBloc, LoadedResponse>(
          listener: (context, response) {
            if (response.type == ResponseType.error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  response.errorMessage!,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: Duration(milliseconds: 3000),
              ));
            }
          },
          child: BlocBuilder<LoaderBloc, LoadedResponse>(
              builder: (context, response) {
            return response.type == ResponseType.success
                ? GameWidget(
                    game: EyeGame(
                        controls:
                            response.gameElements[DataType.controls]!.sprites,
                        level: Level(
                            background: ParallaxBackground(
                                backgroundImage: response
                                    .gameElements[DataType.level]!
                                    .backgroundImage,
                                floorImage: response
                                    .gameElements[DataType.level]!.floorImage),
                            platforms: response
                                .gameElements[DataType.level]!.platforms,
                            hero: Hero(
                                speed:
                                    response.gameElements[DataType.hero]!.speed,
                                spriteSheet: response
                                    .gameElements[DataType.hero]!.sprites),
                            ennemies: response.gameElements[DataType.enemy]!
                                .map<Enemy>((property) {
                              return Enemy(
                                  spriteSheet: property.sprites,
                                  speed: property.speed,
                                  startPosition: Vector2(
                                      property.sprites["face"].posX,
                                      property.sprites["face"].posY));
                            }).toList())),
                  )
                : Container();
          }),
        ),
      ),
    );
  }
}
