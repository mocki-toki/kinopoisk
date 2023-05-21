import 'package:kinopoisk_base/core/core.dart';

class PreloaderWidget extends StatelessWidget {
  const PreloaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
    );
  }
}
