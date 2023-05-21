import 'package:kinopoisk_base/movie/movie.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieListTileWidget extends StatelessWidget {
  const MovieListTileWidget(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      onTap: () => launchUrl(Uri.parse('https://www.kinopoisk.ru/film/${movie.id}')),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Theme.of(context).hoverColor,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _Poster(movie.poster),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name ?? 'No name',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    movie.year.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    movie.genres.join(', '),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster(this.poster);

  final String? poster;

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (poster == null) {
      widget = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.grey[800],
        ),
        child: Icon(Icons.no_photography),
      );
    } else {
      widget = CachedNetworkImage(
        imageUrl: poster!,
        fadeInDuration: Duration.zero,
        fadeOutDuration: Duration.zero,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        placeholder: (_, __) => Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[700]!,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.grey[800],
            ),
          ),
        ),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
      );
    }

    return SizedBox(
      width: 70,
      height: 110,
      child: widget,
    );
  }
}
