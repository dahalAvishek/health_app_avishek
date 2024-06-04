part of 'patient_bloc.dart';

@freezed
class PatientState with _$PatientState {
  const factory PatientState.initial() = _Initial;
  const factory PatientState.loading() = _Loading;
  const factory PatientState.success(List<PatientEntity>? patients) = _Success;
  const factory PatientState.failure(String message) = _Failure;
}
