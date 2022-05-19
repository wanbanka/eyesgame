import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert' show json;

import 'package:flame/game.dart' show GameWidget;

import '../Components/Game/EyeGame.dart';
import '../Components/Level/Level.dart';
import '../Components/Sprites/Characters/Hero.dart' as Hero;

import '../Models/CharFrame.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: rootBundle.loadString("assets/parameters/hero.json"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> jsonFound = json.decode(snapshot.data);

            jsonFound["hero"]["states"] = Map<String, CharFrame>.from(
                jsonFound["hero"]["states"].map((key, value) {
              return MapEntry(key, CharFrame.fromJson(value));
            }));

            return GameWidget(
                game: EyeGame(
                    level: Level(sprites: [
              Hero.Hero(spriteSheet: jsonFound["hero"]["states"])
            ])));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
