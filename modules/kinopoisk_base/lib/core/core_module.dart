import 'package:kinopoisk_base/core/core.dart';
import 'package:kinopoisk_base/core/infrastructure/services/dio_service.dart';
import 'package:kinopoisk_base/core/infrastructure/services/logger_service.dart';

class CoreModule extends Module {
  @override
  void configureServices(ServiceCollection services) {
    services.addModule(PansyArchFlutterModule());
    services.addModule(PansyArchGoRouterModule());

    services.addLoggerService();
    services.addDioService();
    services.addSingletonFactory((sp) => sp.getRequired<DioService>().dio);
  }
}
