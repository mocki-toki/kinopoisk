// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_repository_impl.dart';

// **************************************************************************
// Dino Generator
// **************************************************************************

extension MovieRepositoryImplFactory on ServiceCollection {
  void addMovieRepositoryImpl([
    ServiceLifetime lifetime = ServiceLifetime.singleton,
    bool registerAliases = true,
  ]) {
    addFactory<MovieRepositoryImpl>(
      lifetime,
      (provider) => MovieRepositoryImpl(
        provider.getRequired<MovieRestClient>(),
      ),
      true,
    );

    if (registerAliases) {
      addAlias<MovieRepository, MovieRepositoryImpl>(true);
    }
  }
}
