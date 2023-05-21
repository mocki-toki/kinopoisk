import 'package:kinopoisk_base/core/core.dart';

part 'dio_service.g.dart';

@Service(ServiceLifetime.singleton)
class DioService implements Initializable {
  DioService();

  final Dio dio = Dio();

  @override
  Future<void> initialize() async {
    dio.options.headers.addAll({'X-API-KEY': PresentationConstants.accessToken});
  }
}
