import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:convert' show json;
import 'dart:async';

import '../Models/CharFrame.dart';

import '../Events/Loader/LoadEvent.dart';
import '../Events/Loader/LoadedEvent.dart';
import '../Events/Loader/LoadingError.dart';
import '../Events/Loader/LoadingEvent.dart';

import '../States/Loader/LoadedResponse.dart';

/**
 * Bloc retrieving and emitting parameters of the different
 * game's parts (sprites, backgrounds...)
 */

class LoaderBloc extends Bloc<LoadEvent, LoadedResponse> {
  LoaderBloc() : super(LoadedResponse()) {
    on<LoadingEvent>(_loadHero);

    on<LoadedEvent>(_emitSuccess);

    on<LoadingError>(_emitError);
  }

  /**
   * Define the hero's features
   */

  Future<void> _loadHero(LoadEvent event, Emitter<LoadedResponse> emit) async {
    Map<String, dynamic> heroParameters =
        json.decode(await rootBundle.loadString("assets/parameters/hero.json"));

    heroParameters["hero"]["states"] = Map<String, CharFrame>.from(
        heroParameters["hero"]["states"].map((key, value) {
      return MapEntry(key, CharFrame.fromJson(value));
    }));

    emit(state.copyWith(name: "hero", attributes: heroParameters["hero"]));
  }

/**
 * Emit success message
 */

  void _emitSuccess(LoadEvent event, Emitter<LoadedResponse> emit) {
    emit(state
        .copyWith(name: "success", attributes: {"message": "Elements loaded"}));
  }

  /**
   * Emit error message
   */

  void _emitError(LoadingError event, Emitter<LoadedResponse> emit) {
    emit(state
        .copyWith(name: "error", attributes: {"message": event.errorMessage}));
  }
}
