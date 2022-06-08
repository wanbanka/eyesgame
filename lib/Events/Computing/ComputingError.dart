import 'ComputeEvent.dart';

/**
 * Error during a computing
 */

class ComputingError extends ComputeEvent {
  ComputingError(this.errorMessage) : super();

  final String errorMessage;
}
