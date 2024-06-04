import 'package:equatable/equatable.dart';

class PatientEntity extends Equatable {
  final String? id;
  final String? name;
  final String? address;
  final DateTime? dateOfBirth;
  final String? phoneNumber;
  final String? weight;
  const PatientEntity({
    this.id,
    this.name,
    this.address,
    this.dateOfBirth,
    this.phoneNumber,
    this.weight,
  });

  @override
  List<Object?> get props =>
      [id, name, address, dateOfBirth, phoneNumber, weight];
}
