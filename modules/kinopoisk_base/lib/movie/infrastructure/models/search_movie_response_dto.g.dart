// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovieResponseDto _$SearchMovieResponseDtoFromJson(
        Map<String, dynamic> json) =>
    SearchMovieResponseDto(
      docs: (json['docs'] as List<dynamic>)
          .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      limit: json['limit'] as int,
      page: json['page'] as int,
      pages: json['pages'] as int,
    );

Map<String, dynamic> _$SearchMovieResponseDtoToJson(
        SearchMovieResponseDto instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'pages': instance.pages,
    };
