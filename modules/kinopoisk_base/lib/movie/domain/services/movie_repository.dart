import 'package:kinopoisk_base/movie/movie.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, SearchMovieResponse>> search({
    required String query,
    required int page,
    required int limit,
  });
}
