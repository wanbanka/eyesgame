import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/Enums/ResponseType.dart';
import '../Models/Enums/DataType.dart';
import '../Models/Properties.dart';

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
  Map<DataType, Properties> _gameElements = {};

  JSONDescriptionService _jsonDescriptionService = JSONDescriptionService();

  String selectLevel;

  LoaderBloc({required this.selectLevel}) : super(LoadedResponse()) {
    on<LoadingEvent>((event, emit) async {
      try {
        _gameElements.addAll({
          DataType.hero: await _loadHero(),
          DataType.background: await _loadLevel(),
          DataType.controls: await _loadControls()
        });

        this.add(LoadedEvent());
      } catch (e) {
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

  Future<Properties> _loadControls() async {
    Map<String, dynamic> parameters =
        await _jsonDescriptionService.loadAttribute(DataType.controls);

    return Properties.fromJson(parameters);
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
      "background_image": level["parallax"]["background"]
    });
  }
}
