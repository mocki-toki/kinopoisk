import 'dart:io';

import 'package:kinopoisk_base/core/core.dart';

extension DataExtension<T> on Future<T> {
  Future<Either<Failure, R>> fromDataToEither<R>([R Function(T data)? extract]) async {
    final logger = getLogger();

    try {
      final response = await this;
      logger.fine('Response: $response');
      return Right(extract?.call(response) ?? response as R);
    } on DioError catch (e) {
      logger.severe('DioError: $e');
      return Left(_handleDioError(e));
    } on SocketException {
      logger.severe('SocketException');
      return Left(NetworkFailure());
    } catch (e) {
      logger.severe('Unknown exception: $e');
      return Left(DomainFailure('$e'));
    }
  }

  Future<Option<Failure>> fromDataToOption() async {
    try {
      await this;
      return None();
    } on DioError catch (e) {
      return Some(_handleDioError(e));
    } on SocketException {
      return Some(NetworkFailure());
    } catch (e) {
      return Some(DomainFailure('$e'));
    }
  }

  Failure _handleDioError(DioError e) {
    if (e.response?.data?.containsKey('message')) {
      return BackendFailure(e.response?.data['message']);
    }

    if (e.error is SocketException) {
      return NetworkFailure();
    }

    return BackendFailure('$e');
  }
}
