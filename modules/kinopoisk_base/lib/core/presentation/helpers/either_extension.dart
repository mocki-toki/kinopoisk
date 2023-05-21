import 'package:kinopoisk_base/core/core.dart';

extension EitherExtension<T> on Either<Failure, T> {
  C when<C>({
    required C Function(T data) success,
    required C Function(Failure failure) failure,
  }) {
    return match<C>(failure, success);
  }
}
