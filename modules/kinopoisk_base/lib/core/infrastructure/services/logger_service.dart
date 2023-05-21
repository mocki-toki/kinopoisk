import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:kinopoisk_base/core/core.dart';

part 'logger_service.g.dart';

@Service(ServiceLifetime.singleton)
class LoggerService implements Initializable {
  @override
  Future<void> initialize() {
    if (kDebugMode) Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      var color = _getColor(record.level);
      var emoji = _getEmoji(record.level);
      print(color('$emoji ${record.level.name}: ${record.time}: ${record.message}'));
    });

    return Future.value();
  }

  AnsiPen _getColor(Level level) {
    switch (level) {
      case Level.INFO:
        return AnsiPen()..blue();
      case Level.WARNING:
        return AnsiPen()..yellow();
      case Level.SEVERE:
        return AnsiPen()..red();
      case Level.SHOUT:
        return AnsiPen()..red();
      default:
        return AnsiPen()..white();
    }
  }

  String _getEmoji(Level level) {
    switch (level) {
      case Level.CONFIG:
        return '📘';
      case Level.INFO:
        return '📘';
      case Level.WARNING:
        return '📙';
      case Level.SEVERE:
        return '📕';
      case Level.SHOUT:
        return '📕';
      default:
        return '📗';
    }
  }
}
