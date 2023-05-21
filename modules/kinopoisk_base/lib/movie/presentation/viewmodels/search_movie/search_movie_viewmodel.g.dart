// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_viewmodel.dart';

// **************************************************************************
// Dino Generator
// **************************************************************************

extension SearchMovieViewModelFactory on ServiceCollection {
  void addSearchMovieViewModel([
    ServiceLifetime lifetime = ServiceLifetime.singleton,
    bool registerAliases = true,
  ]) {
    addFactory<SearchMovieViewModel>(
      lifetime,
      (provider) => SearchMovieViewModel(
        provider.getRequired<MovieRepository>(),
      ),
      true,
    );

    if (registerAliases) {
      addAlias<Cubit, SearchMovieViewModel>(true);
      addAlias<BlocBase, SearchMovieViewModel>(true);
      addAlias<StateStreamableSource, SearchMovieViewModel>(true);
      addAlias<StateStreamable, SearchMovieViewModel>(true);
      addAlias<Streamable, SearchMovieViewModel>(true);
      addAlias<Closable, SearchMovieViewModel>(true);
      addAlias<Emittable, SearchMovieViewModel>(true);
      addAlias<ErrorSink, SearchMovieViewModel>(true);
    }
  }
}
