import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/Enums/ResponseType.dart';
import '../Models/Enums/DataType.dart';
import '../Models/Enums/Filter.dart';

import '../Models/Properties.dart';
import '../Models/CharFrame.dart';

import '../Events/Loader/LoadEvent.dart';
import '../Events/Loader/LoadedEvent.dart';
import '../Events/Loader/LoadingError.dart';
import '../Events/Loader/LoadingEvent.dart';

import '../States/Loader/LoadedResponse.dart';

import '../Services/JSONDescriptionService.dart';

/**
 * Bloc retrieving and emitting parameters of the different
 * game's parts (sprites, backgrounds...)
 */

class LoaderBloc extends Bloc<LoadEvent, LoadedResponse> {
  Map<DataType, List<Properties>> _gameElements = {};

  JSONDescriptionService _jsonDescriptionService = JSONDescriptionService();

  String selectLevel;

  LoaderBloc({required this.selectLevel}) : super(LoadedResponse()) {
    on<LoadingEvent>((event, emit) async {
      try {
        _gameElements.addAll({
          DataType.hero: [await _loadHero()],
          DataType.level: [await _loadLevel()],
          DataType.controls: await _loadControls(),
          DataType.enemy: await _loadEnemies(),
          DataType.platform: await _loadPlatforms()
        });

        this.add(LoadedEvent());
      } on Exception catch (e) {
        print("Erreur: ${e}");

        this.add(LoadingError("Erreur: $e"));
      }
    });

    on<LoadedEvent>((event, emit) {
      emit(state.copyWith(
          type: ResponseType.success, gameElements: _gameElements));
    });

    on<LoadingError>((event, emit) {
      emit(state.copyWith(
          type: ResponseType.error, errorMessage: event.errorMessage));
    });
  }

  /**
   * Define the hero's features
   */

  Future<Properties> _loadHero() async {
    Map<String, dynamic> heroParameters =
        await _jsonDescriptionService.loadAttribute(DataType.hero);

    return Properties.fromJson(heroParameters);
  }

  /**
   * Define the player's controls
   */

  Future<List<Properties>> _loadControls() async {
    Map<String, dynamic> controls =
        await _jsonDescriptionService.loadAttribute(DataType.controls);

    List<Properties> propControls = [];

    controls.forEach((key, value) {
      print("Control: $value");

      propControls.add(Properties.fromJson({
        "control": {
          "src_image": value["src_image"],
          "nb_sprites": value["nb_sprites"],
          "type": key
        },
        "x": value["x"],
        "y": value["y"]
      }));
    });

    return propControls;
  }

/**
 * Define the level's features
 */

  Future<Properties> _loadLevel() async {
    Map<String, dynamic> level =
        await _jsonDescriptionService.loadLevel(this.selectLevel);

    return Properties.fromJson({
      "name": level["name"],
      "floor_image": level["parallax"]["floor"],
      "background_image": level["parallax"]["background"],
    });
  }

  /**
   * Load the level's platforms
   */

  Future<List<Properties>> _loadPlatforms() async {
    Map<String, dynamic> level =
        await _jsonDescriptionService.loadLevel(this.selectLevel);

    List<dynamic> levelPlatforms = level["platforms"];

    List<Properties> propPlatforms = [];

    levelPlatforms.forEach((platform) {
      propPlatforms.add(Properties.fromJson({
        "platform": {
          "src_image": platform["src_image"],
          "nb_sprites": platform["nb_sprites"],
          "type": platform["type"],
          "size": platform["size"]
        },
        "x": platform["x"],
        "y": platform["y"]
      }));
    });

    print("PropPlatforms: $propPlatforms");

    return propPlatforms;
  }

  /**
   * Load all ennemies' features of the level
   */

  Future<List<Properties>> _loadEnemies() async {
    Map<String, dynamic> level =
        await _jsonDescriptionService.loadLevel(this.selectLevel);

    List<dynamic> levelEnemies = level["enemies"];

    List<Properties> propEnemies = [];

    levelEnemies.forEach((enemy) async {
      Properties existing = propEnemies.firstWhere(
          (propEnemy) => propEnemy.name == enemy["name"],
          orElse: () => Properties());

      if (existing.name.isNotEmpty) {
        propEnemies.add(existing.copyWith(
            posX: enemy["x"].toDouble(), posY: enemy["y"].toDouble()));
      } else {
        Map<String, dynamic> foundEnemy =
            await _jsonDescriptionService.loadAttribute(DataType.enemy,
                filter: Filter.name, filterSearch: enemy["name"]);

        propEnemies.add(Properties.fromJson(foundEnemy).copyWith(
            posX: enemy["x"].toDouble(), posY: enemy["y"].toDouble()));
      }
    });

    return propEnemies;
  }
}
