import 'package:kinopoisk_base/movie/movie.dart';

part 'search_movie_response.freezed.dart';

@freezed
class SearchMovieResponse with _$SearchMovieResponse {
  const factory SearchMovieResponse({
    required List<Movie> docs,
    required int total,
    required int limit,
    required int page,
    required int pagesCount,
  }) = _SearchMovieResponse;
}
