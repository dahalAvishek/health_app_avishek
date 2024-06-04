import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:health_app_2/layers/domain/repositories.dart/patients_repositories.dart';
import 'package:health_app_2/utils/service/firebase_service.dart';

import '../../../core/error/failures.dart';
import '../../domain/entities/patients_entity.dart';

class PatientRespositoryImpl implements PatientsRepositories {
  PatientRespositoryImpl();

  @override
  Future<Either<Failure, List<PatientEntity>>> getPatients() async {
    try {
    final patientsStream =  FirestoreService.getHistory();
    Future<List<dynamic>> dynamicListFuture = patientsStream.toList();
    return Right(dynamicListFuture.)
    } on ServerException  {
      return Left(ServerFailure(message: "Error fetching patients")); 
    }
  };

}