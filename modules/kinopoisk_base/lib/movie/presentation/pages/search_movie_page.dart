import 'package:kinopoisk_base/movie/movie.dart';
import 'package:kinopoisk_base/movie/presentation/viewmodels/search_movie/search_movie_state.dart';
import 'package:kinopoisk_base/movie/presentation/viewmodels/search_movie/search_movie_viewmodel.dart';
import 'package:kinopoisk_base/movie/presentation/widgets/movie_list_tile_widget.dart';
import 'package:kinopoisk_base/movie/presentation/widgets/search_appbar_widget.dart';

const _triggerLoad = 200;

class SearchMoviePage extends StatelessWidget {
  const SearchMoviePage(this.route, {super.key});

  final SearchMoviePageRoute route;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.getRequired<SearchMovieViewModel>(),
      child: const _SearchMoviePageContent(),
    );
  }
}

class _SearchMoviePageContent extends StatelessWidget {
  const _SearchMoviePageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMovieViewModel, SearchMovieState>(
      builder: (_, state) {
        return Scaffold(
          appBar: SearchAppbarWidget(
            onSearch: (query) => context.read<SearchMovieViewModel>().search(query),
            isLoading: state.isLoading,
          ),
          body: state.map(
            initial: (_) => _Initial(),
            loading: (state) => _Loaded(state),
            loaded: (state) => _Loaded(state),
            loadingMore: (state) => _Loaded(state),
            failure: (state) => _Failure(state.failure),
          ),
        );
      },
    );
  }
}

class _Initial extends StatelessWidget {
  const _Initial();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Search movies',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _Loaded extends StatelessWidget {
  const _Loaded(this.state);

  final SearchMovieState state;

  @override
  Widget build(BuildContext context) {
    final movies = state.getMoviesOrFallback();

    return NotificationListener(
      onNotification: (value) => _onNotification(context, value),
      child: CustomScrollView(
        slivers: [
          SliverImplicitlyAnimatedList<Movie>(
            equalityChecker: (a, b) => a.id == b.id,
            items: movies,
            itemBuilder: (_, movie) => MovieListTileWidget(movie),
          ),
          if (state.isLoadingMore) const SliverToBoxAdapter(child: PreloaderWidget()),
        ],
      ),
    );
  }

  bool _onNotification(BuildContext context, notification) {
    if (notification is ScrollUpdateNotification && !state.hasReachedMax && !state.isLoadingMore) {
      final metrics = notification.metrics;
      final maxScrollExtent = metrics.maxScrollExtent;
      final pixels = metrics.pixels;
      if (maxScrollExtent - pixels <= _triggerLoad) {
        context.read<SearchMovieViewModel>().loadNextPage();
      }
    }
    return false;
  }
}

class _Failure extends StatelessWidget {
  const _Failure(this.failure);

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$failure'));
  }
}

class SearchMoviePageRoute extends ActivityRoute {
  const SearchMoviePageRoute();

  static const path = '/';

  static SearchMoviePageRoute fromData(_) => SearchMoviePageRoute();

  @override
  RouteData get data => RouteData(path: path);
}
