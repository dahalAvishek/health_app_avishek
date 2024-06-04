import '../../domain/entities/patients_entity.dart';

class Patient extends PatientEntity {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final DateTime? dateOfBirth;
  @override
  final String? phoneNumber;
  @override
  final String? weight;
  const Patient({
    this.id,
    this.name,
    this.address,
    this.dateOfBirth,
    this.phoneNumber,
    this.weight,
  }) : super(
          id: id,
          name: name,
          address: address,
          dateOfBirth: dateOfBirth,
          phoneNumber: phoneNumber,
          weight: weight,
        );
}
