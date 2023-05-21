// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_service.dart';

// **************************************************************************
// Dino Generator
// **************************************************************************

extension DioServiceFactory on ServiceCollection {
  void addDioService([
    ServiceLifetime lifetime = ServiceLifetime.singleton,
    bool registerAliases = true,
  ]) {
    addFactory<DioService>(
      lifetime,
      (provider) => DioService(),
      true,
    );

    if (registerAliases) {
      addAlias<Initializable, DioService>(true);
    }
  }
}
