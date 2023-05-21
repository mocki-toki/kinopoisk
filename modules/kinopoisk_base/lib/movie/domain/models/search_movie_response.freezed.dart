// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_movie_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchMovieResponse {
  List<Movie> get docs => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pagesCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchMovieResponseCopyWith<SearchMovieResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchMovieResponseCopyWith<$Res> {
  factory $SearchMovieResponseCopyWith(
          SearchMovieResponse value, $Res Function(SearchMovieResponse) then) =
      _$SearchMovieResponseCopyWithImpl<$Res, SearchMovieResponse>;
  @useResult
  $Res call({List<Movie> docs, int total, int limit, int page, int pagesCount});
}

/// @nodoc
class _$SearchMovieResponseCopyWithImpl<$Res, $Val extends SearchMovieResponse>
    implements $SearchMovieResponseCopyWith<$Res> {
  _$SearchMovieResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docs = null,
    Object? total = null,
    Object? limit = null,
    Object? page = null,
    Object? pagesCount = null,
  }) {
    return _then(_value.copyWith(
      docs: null == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pagesCount: null == pagesCount
          ? _value.pagesCount
          : pagesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchMovieResponseCopyWith<$Res>
    implements $SearchMovieResponseCopyWith<$Res> {
  factory _$$_SearchMovieResponseCopyWith(_$_SearchMovieResponse value,
          $Res Function(_$_SearchMovieResponse) then) =
      __$$_SearchMovieResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Movie> docs, int total, int limit, int page, int pagesCount});
}

/// @nodoc
class __$$_SearchMovieResponseCopyWithImpl<$Res>
    extends _$SearchMovieResponseCopyWithImpl<$Res, _$_SearchMovieResponse>
    implements _$$_SearchMovieResponseCopyWith<$Res> {
  __$$_SearchMovieResponseCopyWithImpl(_$_SearchMovieResponse _value,
      $Res Function(_$_SearchMovieResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docs = null,
    Object? total = null,
    Object? limit = null,
    Object? page = null,
    Object? pagesCount = null,
  }) {
    return _then(_$_SearchMovieResponse(
      docs: null == docs
          ? _value._docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pagesCount: null == pagesCount
          ? _value.pagesCount
          : pagesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SearchMovieResponse implements _SearchMovieResponse {
  const _$_SearchMovieResponse(
      {required final List<Movie> docs,
      required this.total,
      required this.limit,
      required this.page,
      required this.pagesCount})
      : _docs = docs;

  final List<Movie> _docs;
  @override
  List<Movie> get docs {
    if (_docs is EqualUnmodifiableListView) return _docs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_docs);
  }

  @override
  final int total;
  @override
  final int limit;
  @override
  final int page;
  @override
  final int pagesCount;

  @override
  String toString() {
    return 'SearchMovieResponse(docs: $docs, total: $total, limit: $limit, page: $page, pagesCount: $pagesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchMovieResponse &&
            const DeepCollectionEquality().equals(other._docs, _docs) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pagesCount, pagesCount) ||
                other.pagesCount == pagesCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_docs),
      total,
      limit,
      page,
      pagesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchMovieResponseCopyWith<_$_SearchMovieResponse> get copyWith =>
      __$$_SearchMovieResponseCopyWithImpl<_$_SearchMovieResponse>(
          this, _$identity);
}

abstract class _SearchMovieResponse implements SearchMovieResponse {
  const factory _SearchMovieResponse(
      {required final List<Movie> docs,
      required final int total,
      required final int limit,
      required final int page,
      required final int pagesCount}) = _$_SearchMovieResponse;

  @override
  List<Movie> get docs;
  @override
  int get total;
  @override
  int get limit;
  @override
  int get page;
  @override
  int get pagesCount;
  @override
  @JsonKey(ignore: true)
  _$$_SearchMovieResponseCopyWith<_$_SearchMovieResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
