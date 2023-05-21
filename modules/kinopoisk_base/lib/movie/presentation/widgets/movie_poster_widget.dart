import 'package:kinopoisk_base/movie/movie.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget(this.poster);

  final String? poster;

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (poster == null) {
      widget = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Theme.of(context).colorScheme.surfaceVariant,
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
          baseColor: Theme.of(context).hoverColor,
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
      width: 50,
      height: 80,
      child: widget,
    );
  }
}
