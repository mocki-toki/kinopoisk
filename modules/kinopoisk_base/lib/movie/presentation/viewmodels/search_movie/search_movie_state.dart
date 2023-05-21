import 'package:kinopoisk_base/movie/movie.dart';

part 'search_movie_state.freezed.dart';

@freezed
class SearchMovieState with _$SearchMovieState {
  const factory SearchMovieState.initial() = SearchMovieInitialState;

  const factory SearchMovieState.loading({
    required String query,
  }) = SearchMovieLoadingState;

  const factory SearchMovieState.loaded({
    required List<Movie> movies,
    required String query,
    required int total,
    required int limit,
    required int page,
    required int pagesCount,
  }) = SearchMovieLoadedState;

  const factory SearchMovieState.loadingMore({
    required List<Movie> movies,
    required String query,
    required int total,
    required int limit,
    required int page,
    required int pagesCount,
  }) = SearchMovieLoadingMoreState;

  const factory SearchMovieState.failure(Failure failure) = SearchMovieFailureState;
}

extension SearchMovieStateX on SearchMovieState {
  bool get isInitial => this is SearchMovieInitialState;

  bool get isLoading => this is SearchMovieLoadingState;

  bool get isLoaded => this is SearchMovieLoadedState;

  bool get isLoadingMore => this is SearchMovieLoadingMoreState;

  bool get isFailure => this is SearchMovieFailureState;

  SearchMovieInitialState toInitial() => const SearchMovieInitialState();

  SearchMovieLoadingState toLoading({required String query}) =>
      SearchMovieLoadingState(query: query);

  SearchMovieLoadedState toLoaded({
    required List<Movie> movies,
    required String query,
    required int total,
    required int limit,
    required int page,
    required int pagesCount,
  }) {
    return SearchMovieLoadedState(
      movies: movies,
      query: query,
      total: total,
      limit: limit,
      page: page,
      pagesCount: pagesCount,
    );
  }

  SearchMovieLoadingMoreState toLoadingMore() {
    return SearchMovieLoadingMoreState(
      movies: getMoviesOrFallback(),
      query: getQueryOrFallback(),
      total: getTotalOrFallback(),
      limit: getLimitOrFallback(),
      page: getPageOrFallback(),
      pagesCount: getPagesCountOrFallback(),
    );
  }

  bool get isEmpty => isLoaded && (this as SearchMovieLoadedState).movies.isEmpty;

  bool get isNotEmpty => isLoaded && (this as SearchMovieLoadedState).movies.isNotEmpty;

  bool get hasReachedMax =>
      isLoaded &&
      (this as SearchMovieLoadedState).page == (this as SearchMovieLoadedState).pagesCount;

  List<Movie> getMoviesOrFallback() {
    return mapOrNull(
          loaded: (state) => state.movies,
          loadingMore: (state) => state.movies,
        ) ??
        const [];
  }

  String getQueryOrFallback() {
    return mapOrNull(
          loading: (state) => state.query,
          loaded: (state) => state.query,
          loadingMore: (state) => state.query,
        ) ??
        '';
  }

  int getTotalOrFallback() {
    return mapOrNull(
          loaded: (state) => state.total,
          loadingMore: (state) => state.total,
        ) ??
        0;
  }

  int getLimitOrFallback() {
    return mapOrNull(
          loaded: (state) => state.limit,
          loadingMore: (state) => state.limit,
        ) ??
        0;
  }

  int getPageOrFallback() {
    return mapOrNull(
          loaded: (state) => state.page,
          loadingMore: (state) => state.page,
        ) ??
        0;
  }

  int getPagesCountOrFallback() {
    return mapOrNull(
          loaded: (state) => state.pagesCount,
          loadingMore: (state) => state.pagesCount,
        ) ??
        0;
  }
}
