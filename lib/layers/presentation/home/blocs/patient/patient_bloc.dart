import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app_2/core/usecases/usecases.dart';
import 'package:health_app_2/layers/domain/entities/patient_entity.dart';
import 'package:health_app_2/layers/domain/usecases/get_patients.dart';

import '../../../../../core/error/failures.dart';

part 'generated/patient_bloc.freezed.dart';
part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final GetPatients _getPatients;

  PatientBloc(this._getPatients) : super(const _Initial()) {
    on<PatientEvent>((event, emit) {});

    on<_Attempt>((event, emit) async {
      emit(const _Loading());
      final data = await _getPatients.call(NoParams());
      
      data.fold(
          (failure) => {
                if (failure is ServerFailure)
                  {log(';gail'),
                    emit(_Failure(
                      failure.message ?? "Server Error!",
                    ))
                  }
              }, (patients) {
                log('patients');
        emit(_Success(patients.patients));
      });
    });
  }
}
