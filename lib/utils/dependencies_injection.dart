import 'package:get_it/get_it.dart';

import '../core/api/api_client.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  sl.registerSingleton<ApiClient>(ApiClient());
  _dataSources();
  _repositories();
  _useCase();
  _blocs();
}

void _repositories() {
  // sl.registerLazySingleton<BrandsRepository>(
  //   () => BrandsRepositoryImpl(brandsRemoteSource: sl()),
  // );
}

void _dataSources() {
  // sl.registerLazySingleton<BrandsRemoteSource>(
  //   () => BrandsRemoteSourceImpl(sl()),
  // );
}

void _useCase() {
  // sl.registerLazySingleton(() => GetFavorites(sl()));
}

void _blocs() {
  // sl.registerFactory(() => SearchBloc(sl()));
}

