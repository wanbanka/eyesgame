import 'package:flutter/material.dart' hide Hero;

import 'package:flame/game.dart' show GameWidget;

import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/LoaderBloc.dart';
import '../States/Loader/LoadedResponse.dart';

import '../Events/Loader/LoadedEvent.dart';
import '../Events/Loader/LoadingError.dart';
import '../Events/Loader/LoadingEvent.dart';

import '../Components/Game/EyeGame.dart';
import '../Components/Level/Level.dart';
import '../Components/Sprites/Characters/Hero.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    try {
      context.read<LoaderBloc>().add(LoadingEvent());
    } catch (e) {
      context.read<LoaderBloc>().add(LoadingError("Erreur: $e"));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<LoaderBloc, LoadedResponse>(builder: (context, response) {
        return response.name == "hero"
            ? GameWidget(
                game: EyeGame(
                    level: Level(sprites: [
                Hero(spriteSheet: response.attributes["states"])
              ])))
            : CircularProgressIndicator();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
