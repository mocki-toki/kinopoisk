import 'package:kinopoisk_base/core/domain/entities/failure.dart';

class DomainFailure extends Failure {
  const DomainFailure(this.message);

  final String message;
}
