import 'package:kinopoisk_base/movie/movie.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String? name,
    required String? alternativeName,
    required String? enName,
    required Iterable<String> names,
    required String type,
    required int year,
    required String description,
    required String shortDescription,
    required String? logo,
    required String? poster,
    required String? backdrop,
    required double rating,
    required int votes,
    required int movieLength,
    required Iterable<String> genres,
    required Iterable<String> countries,
    required Iterable<int> releaseYears,
  }) = _Movie;
}
