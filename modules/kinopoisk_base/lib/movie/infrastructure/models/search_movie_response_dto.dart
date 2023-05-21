import 'package:kinopoisk_base/movie/infrastructure/models/movie_dto.dart';
import 'package:kinopoisk_base/movie/movie.dart';

part 'search_movie_response_dto.g.dart';

@JsonSerializable()
class SearchMovieResponseDto {
  const SearchMovieResponseDto({
    required this.docs,
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });

  factory SearchMovieResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieResponseDtoFromJson(json);

  final List<MovieDto> docs;
  final int total;
  final int limit;
  final int page;
  final int pages;

  Map<String, dynamic> toJson() => _$SearchMovieResponseDtoToJson(this);
}

extension SearchMovieResponseDtoToDomainX on SearchMovieResponseDto {
  SearchMovieResponse toDomain() {
    return SearchMovieResponse(
      docs: docs.map((e) => e.toDomain()).toList(),
      total: total,
      limit: limit,
      page: page,
      pagesCount: pages,
    );
  }
}

extension SearchMovieResponseToDtoX on SearchMovieResponse {
  SearchMovieResponseDto toDto() {
    return SearchMovieResponseDto(
      docs: docs.map((e) => e.toDto()).toList(),
      total: total,
      limit: limit,
      page: page,
      pages: pagesCount,
    );
  }
}
