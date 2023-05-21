import 'package:kinopoisk_base/core/core.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({super.key, required this.serviceProvider});

  final ServiceProvider serviceProvider;

  @override
  Widget build(BuildContext context) {
    return DinoProvider(
      serviceProvider: serviceProvider,
      child: MaterialApp.router(
        scaffoldMessengerKey: serviceProvider.getRequired<ScaffoldMessengerProvider>().key,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        routerConfig: serviceProvider.getRequired<GoRouter>(),
        title: PresentationConstants.applicationName,
      ),
    );
  }
}
