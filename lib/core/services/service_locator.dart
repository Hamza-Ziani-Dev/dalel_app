

// ignore_for_file: non_constant_identifier_names

import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void SetupServiceLocator() {
getIt.registerSingleton<CacheHelper>(CacheHelper());
}
