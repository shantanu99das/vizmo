import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'employee_model.g.dart';
@JsonSerializable()
class EmployeeModel{
 @JsonKey(name:'name')
  String? name;
 @JsonKey(name:'avatar')
 String? avatar;
 @JsonKey(name:'email')
 String? email;
 @JsonKey(name:'phone')
 String? phone;
 @JsonKey(name:'birthday')
 String? birthday;
 @JsonKey(name:'id')
 String? id;
 @JsonKey(name:'country')
 String? country;
 @JsonKey(name:'department')
 List<String>? department;


 EmployeeModel({
   this.name,
   this.avatar,
   this.birthday,
   this.country,
   this.department,
   this.email,
   this.id,
   this.phone
});

 factory EmployeeModel.fromJson(Map<String,dynamic> json)=>
    _$EmployeeModelFromJson(json);


 Map<String,dynamic> toJson()=> _$EmployeeModelToJson(this);

 }