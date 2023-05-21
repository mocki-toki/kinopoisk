library core;

export 'core_module.dart';

export 'domain/entities/backend_failure.dart';
export 'domain/entities/domain_failure.dart';
export 'domain/entities/failure.dart';
export 'domain/entities/network_failure.dart';

export 'infrastructure/helpers/data_extension.dart';
export 'infrastructure/helpers/object_extension.dart';
export 'infrastructure/kinopoisk_api_constants.dart';

export 'presentation/helpers/either_extension.dart';
export 'presentation/widgets/preloader_widget.dart';
export 'presentation/widgets/sliver_implicitly_animated_list.dart';
export 'presentation/presentation_constants.dart';

export 'dart:async';
export 'package:flutter/material.dart' hide RouteFactory, RoutePageBuilder, Path;
export 'dart:collection';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:fpdart/fpdart.dart' hide State, Task, id;

export 'package:logging/logging.dart';
export 'package:pansy_arch_flutter/pansy_arch_flutter.dart';
export 'package:pansy_arch_go_router/pansy_arch_go_router.dart';
export 'package:retrofit/retrofit.dart';
export 'package:dio/dio.dart' hide Headers;
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:shimmer/shimmer.dart';
