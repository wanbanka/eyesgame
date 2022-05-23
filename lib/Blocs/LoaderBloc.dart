import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/CharFrame.dart';
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
  Map<DataType, Properties> _heroAttributes = {};

  JSONDescriptionService _jsonDescriptionService = JSONDescriptionService();

  LoaderBloc() : super(LoadedResponse()) {
    on<LoadingEvent>((event, emit) async {
      try {
        dynamic hero = await _loadHero();

        print(hero);

        _heroAttributes.addAll({DataType.hero: hero});

        this.add(LoadedEvent());
      } catch (e) {
        this.add(LoadingError("Erreur: $e"));
      }
    });

    on<LoadedEvent>((event, emit) {
      emit(state.copyWith(
          type: ResponseType.success, attributes: _heroAttributes));
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
        await _jsonDescriptionService.loadParameters("hero");

    return Properties.fromJson(heroParameters);
  }
}
