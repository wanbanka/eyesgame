import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/Enums/Coords.dart';
import '../Models/Enums/ResponseType.dart';

import '../Events/Computing/ComputeEvent.dart';
import '../Events/Computing/ComputingEvent.dart';
import '../Events/Computing/ComputingError.dart';

import '../States/Loader/LoadedResponse.dart';

import '../Services/MathService.dart';

/**
 * Bloc computing and emitting new coords of a character
 */

class MathBloc extends Bloc<ComputeEvent, LoadedResponse> {
  MathService _mathService = MathService();

  MathBloc() : super(LoadedResponse()) {
    on<ComputingEvent>((event, emit) {
      emit(state.copyWith(
          type: ResponseType.success,
          computedCoords: {Coords.x: event.x, Coords.y: event.y}));
    });

    on<ComputingError>((event, emit) {
      emit(state.copyWith(
          type: ResponseType.error, errorMessage: event.errorMessage));
    });
  }

  /**
   * Compute the trajectory of a character
   */

  void computeTrajectory(double gravity, List<double> velocity, double time,
      {bool isOnWall = false, bool isOnCeiling = false, int touchedWalls = 0}) {
    try {
      List<double> newCoords = _mathService.computeTrajectory(
          gravity, velocity, time,
          isOnWall: isOnWall, isOnCeiling: isOnCeiling);

      assert(newCoords.length == 2,
          "You have to get the new coords (x and y) of the position");

      this.add(ComputingEvent(x: newCoords[0], y: newCoords[1]));
    } catch (e) {
      this.add(ComputingError("Erreur de calcul: $e"));
    }
  }
}
