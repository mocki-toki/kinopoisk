import 'package:kinopoisk_base/movie/infrastructure/services/movie_repository_impl.dart';
import 'package:kinopoisk_base/movie/infrastructure/services/movie_rest_client.dart';
import 'package:kinopoisk_base/movie/movie.dart';
import 'package:kinopoisk_base/movie/presentation/pages/search_movie_page.dart';
import 'package:kinopoisk_base/movie/presentation/viewmodels/search_movie/search_movie_viewmodel.dart';

class MovieModule extends Module {
  @override
  void configureServices(ServiceCollection services) {
    services.addModule(CoreModule());

    services.addSingletonFactory((sp) => MovieRestClient(sp.getRequired()));
    services.addMovieRepositoryImpl();
    services.addSearchMovieViewModel();

    services.addRoutes((sp) {
      return [
        route(
          path: SearchMoviePageRoute.path,
          routeFactory: (data) => SearchMoviePageRoute.fromData(data),
          builder: (_, __, route) => SearchMoviePage(route),
        ),
      ];
    });
  }
}
