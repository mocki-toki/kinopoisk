import 'package:kinopoisk_base/movie/infrastructure/models/search_movie_response_dto.dart';
import 'package:kinopoisk_base/movie/infrastructure/services/movie_rest_client.dart';
import 'package:kinopoisk_base/movie/movie.dart';

part 'movie_repository_impl.g.dart';

@Service(ServiceLifetime.singleton)
class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieRestClient);

  final MovieRestClient _movieRestClient;

  @override
  Future<Either<Failure, SearchMovieResponse>> search({
    required String query,
    required int page,
    required int limit,
  }) {
    return _movieRestClient.search(page, limit, query).fromDataToEither((e) => e.toDomain());
  }
}
