import 'ComputeEvent.dart';

/**
 * Computed trajectory's coords 
 */

class ComputingEvent extends ComputeEvent {
  ComputingEvent({required this.x, required this.y}) : super();

  double x;

  double y;
}
