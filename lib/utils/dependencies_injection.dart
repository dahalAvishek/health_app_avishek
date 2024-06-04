// import 'package:get_it/get_it.dart';
// import 'package:health_app_2/layers/data/repositories/patient_respository_impl.dart';
// import 'package:health_app_2/layers/data/sources/patient_remote_source.dart';
// import 'package:health_app_2/layers/domain/repository/patient_respository.dart';
// import 'package:health_app_2/layers/domain/usecases/get_patients.dart';
// import 'package:health_app_2/layers/presentation/home/blocs/patient/patient_bloc.dart';

// import '../core/api/api_client.dart';
// import 'service/firebase_service.dart';

// GetIt sl = GetIt.instance;

// Future<void> serviceLocator() async {
//   sl.registerSingleton<ApiClient>(ApiClient());
//   _dataSources();
//   _repositories();
//   _initFirestore();
//   _useCase();
//   _blocs();
// }

// Future<void> _initFirestore() async {
//   await FirestoreService.init();
// }



// void _repositories() {
//   sl.registerLazySingleton<PatientRespository>(
//     () => PatientRepositoryImpl(patientRemoteSource: sl()),
//   );
// }

// void _dataSources() {
//   sl.registerLazySingleton<PatientRemoteSource>(
//     () => PatientRemoteSourceImpl(sl()),
//   );
// }

// void _useCase() {
//   sl.registerLazySingleton(() => GetPatients(sl()));
// }

// void _blocs() {
//   sl.registerFactory(() => PatientBloc(sl()));
// }
