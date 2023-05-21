// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger_service.dart';

// **************************************************************************
// Dino Generator
// **************************************************************************

extension LoggerServiceFactory on ServiceCollection {
  void addLoggerService([
    ServiceLifetime lifetime = ServiceLifetime.singleton,
    bool registerAliases = true,
  ]) {
    addFactory<LoggerService>(
      lifetime,
      (provider) => LoggerService(),
      true,
    );

    if (registerAliases) {
      addAlias<Initializable, LoggerService>(true);
    }
  }
}
