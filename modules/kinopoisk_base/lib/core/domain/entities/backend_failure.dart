import 'package:kinopoisk_base/core/domain/entities/failure.dart';

class BackendFailure extends Failure {
  const BackendFailure(this.message);

  final String message;
}
