import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:health_app_2/layers/domain/entities/patients_entity.dart';

import '../../../core/error/failures.dart';

abstract class PatientsRepositories {
  Future<Either<Failure, List<PatientEntity>>> getPatients();
}