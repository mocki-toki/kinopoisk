import 'package:kinopoisk_base/movie/movie.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto {
  const MovieDto({
    required this.id,
    required this.name,
    required this.alternativeName,
    required this.enName,
    required this.names,
    required this.type,
    required this.year,
    required this.description,
    required this.shortDescription,
    required this.logo,
    required this.poster,
    required this.backdrop,
    required this.rating,
    required this.votes,
    required this.movieLength,
    required this.genres,
    required this.countries,
    required this.releaseYears,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) => _$MovieDtoFromJson(json);

  final int id;
  final String name;
  final String alternativeName;
  final String enName;
  final Iterable<String> names;
  final String type;
  final int year;
  final String description;
  final String shortDescription;
  final String? logo;
  final String? poster;
  final String? backdrop;
  final double rating;
  final int votes;
  final int movieLength;
  final Iterable<String> genres;
  final Iterable<String> countries;
  final Iterable<int> releaseYears;

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);
}

extension MovieDtoToDomainX on MovieDto {
  Movie toDomain() {
    return Movie(
      id: id,
      name: name.isNotEmpty ? name : names.firstOrNull,
      alternativeName: alternativeName,
      enName: enName,
      names: names,
      type: type,
      year: year,
      description: description,
      shortDescription: shortDescription,
      logo: logo,
      poster: poster,
      backdrop: backdrop,
      rating: rating,
      votes: votes,
      movieLength: movieLength,
      genres: genres,
      countries: countries,
      releaseYears: releaseYears,
    );
  }
}

extension MovieToDtoX on Movie {
  MovieDto toDto() {
    return MovieDto(
      id: id,
      name: name ?? '',
      alternativeName: alternativeName ?? '',
      enName: enName ?? '',
      names: names,
      type: type,
      year: year,
      description: description,
      shortDescription: shortDescription,
      logo: logo,
      poster: poster,
      backdrop: backdrop,
      rating: rating,
      votes: votes,
      movieLength: movieLength,
      genres: genres,
      countries: countries,
      releaseYears: releaseYears,
    );
  }
}
