import 'package:kinopoisk_base/movie/movie.dart';
import 'package:kinopoisk_base/movie/presentation/viewmodels/search_movie/search_movie_state.dart';

part 'search_movie_viewmodel.g.dart';

@Service(ServiceLifetime.singleton)
class SearchMovieViewModel extends Cubit<SearchMovieState> {
  SearchMovieViewModel(this._movieRepository) : super(const SearchMovieState.initial());

  static const int limit = 50;

  final MovieRepository _movieRepository;

  Future<void> search(String query) async {
    query = query.trim();
    if (query.isEmpty) return emit(const SearchMovieState.initial());

    emit(state.toLoading(query: query));
    final result = await _movieRepository.search(
      query: query,
      page: 1,
      limit: limit,
    );

    if (query != state.getQueryOrFallback()) return;

    emit(result.when(
      success: (movies) {
        return state.toLoaded(
          movies: movies.docs,
          query: query,
          total: movies.total,
          limit: movies.limit,
          page: movies.page,
          pagesCount: movies.pagesCount,
        );
      },
      failure: SearchMovieState.failure,
    ));
  }

  Future<void> loadNextPage() async {
    if (!state.isLoaded) return;
    final page = state.getPageOrFallback() + 1;

    emit(state.toLoadingMore());
    final result = await _movieRepository.search(
      query: state.getQueryOrFallback(),
      page: page,
      limit: limit,
    );

    emit(
      result.when(
        success: (movies) {
          final newMovies = [...state.getMoviesOrFallback(), ...movies.docs];
          return state.toLoaded(
            movies: newMovies,
            query: state.getQueryOrFallback(),
            total: movies.total,
            limit: movies.limit,
            page: movies.page,
            pagesCount: movies.pagesCount,
          );
        },
        failure: SearchMovieState.failure,
      ),
    );
  }
}
