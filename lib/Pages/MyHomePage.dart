import 'package:flutter/material.dart' hide Hero;

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
      body: BlocListener<LoaderBloc, LoadedResponse>(
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
                      controls: response.attributes[DataType.controls]!.sprites,
                      level: Level(
                          background: ParallaxBackground(
                              backgroundImage: response
                                  .attributes[DataType.background]!
                                  .backgroundImage,
                              floorImage: response
                                  .attributes[DataType.background]!.floorImage),
                          hero: Hero(
                              speed: response.attributes[DataType.hero]!.speed,
                              spriteSheet:
                                  response.attributes[DataType.hero]!.sprites),
                          ennemies: [])),
                )
              : Container();
        }),
      ),
    );
  }
}
