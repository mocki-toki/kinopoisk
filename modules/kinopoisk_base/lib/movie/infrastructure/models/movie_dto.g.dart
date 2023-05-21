// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDto _$MovieDtoFromJson(Map<String, dynamic> json) => MovieDto(
      id: json['id'] as int,
      name: json['name'] as String,
      alternativeName: json['alternativeName'] as String,
      enName: json['enName'] as String,
      names: (json['names'] as List<dynamic>).map((e) => e as String),
      type: json['type'] as String,
      year: json['year'] as int,
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String,
      logo: json['logo'] as String?,
      poster: json['poster'] as String?,
      backdrop: json['backdrop'] as String?,
      rating: (json['rating'] as num).toDouble(),
      votes: json['votes'] as int,
      movieLength: json['movieLength'] as int,
      genres: (json['genres'] as List<dynamic>).map((e) => e as String),
      countries: (json['countries'] as List<dynamic>).map((e) => e as String),
      releaseYears:
          (json['releaseYears'] as List<dynamic>).map((e) => e as int),
    );

Map<String, dynamic> _$MovieDtoToJson(MovieDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternativeName': instance.alternativeName,
      'enName': instance.enName,
      'names': instance.names.toList(),
      'type': instance.type,
      'year': instance.year,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'logo': instance.logo,
      'poster': instance.poster,
      'backdrop': instance.backdrop,
      'rating': instance.rating,
      'votes': instance.votes,
      'movieLength': instance.movieLength,
      'genres': instance.genres.toList(),
      'countries': instance.countries.toList(),
      'releaseYears': instance.releaseYears.toList(),
    };
