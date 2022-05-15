// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      birthday: json['birthday'] as String?,
      country: json['country'] as String?,
      department: (json['department'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email: json['email'] as String?,
      id: json['id'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'id': instance.id,
      'country': instance.country,
      'department': instance.department,
    };
