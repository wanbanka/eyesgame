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

  void computeTrajectory(
      double gravity, double velocityX, double velocityY, double time) {
    try {
      double x = _mathService.computeTrajectory(gravity, velocityX, time);

      double y = _mathService.computeTrajectory(gravity, velocityY, time,
          isXAxis: false);

      this.add(ComputingEvent(x: x, y: y));
    } catch (e) {
      this.add(ComputingError("Erreur de calcul: $e"));
    }
  }
}
