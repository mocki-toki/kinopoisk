import 'package:kinopoisk_base/movie/infrastructure/models/search_movie_response_dto.dart';
import 'package:kinopoisk_base/movie/movie.dart';

part 'movie_rest_client.g.dart';

@RestApi(baseUrl: KinopoiskApiConstants.baseUrl)
abstract class MovieRestClient {
  factory MovieRestClient(Dio dio) = _MovieRestClient;

  @GET('/v1.2/movie/search')
  Future<SearchMovieResponseDto> search(
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('query') String query,
  );
}
