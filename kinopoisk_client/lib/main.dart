import 'package:kinopoisk_base/movie/movie.dart';
import 'package:kinopoisk_client/application_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final services = ServiceCollection();
  services.addModule(MovieModule());

  final rootScope = services.buildRootScope();
  await rootScope.initialize();

  runApp(ApplicationWidget(serviceProvider: rootScope.serviceProvider));
}
