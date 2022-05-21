import 'LoadEvent.dart';

/**
 * Failure during loading
 */

class LoadingError extends LoadEvent {
  LoadingError(this.errorMessage) : super();

  final String errorMessage;
}
