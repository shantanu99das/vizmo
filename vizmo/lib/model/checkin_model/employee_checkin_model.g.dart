// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_checkin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeCheckInModel _$EmployeeCheckInModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeCheckInModel(
      id: json['id'] as String?,
      checkIn: json['checkin'] as String?,
      employeeId: json['employeeId'] as String?,
      location: json['location'] as String?,
      poupose: json['purpose'] as String?,
    );

Map<String, dynamic> _$EmployeeCheckInModelToJson(
        EmployeeCheckInModel instance) =>
    <String, dynamic>{
      'checkin': instance.checkIn,
      'location': instance.location,
      'purpose': instance.poupose,
      'id': instance.id,
      'employeeId': instance.employeeId,
    };
