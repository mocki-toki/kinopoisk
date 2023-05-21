import 'package:kinopoisk_base/core/core.dart';

extension ObjectExtension on Object {
  Logger getLogger() => Logger('$runtimeType');
}
