
import 'package:json_annotation/json_annotation.dart';
part 'employee_checkin_model.g.dart';

@JsonSerializable()
class EmployeeCheckInModel{
  @JsonKey(name:'checkin')
  String? checkIn;
  @JsonKey(name:'location')
  String? location;
  @JsonKey(name:'purpose')
  String? poupose;
  @JsonKey(name:'id')
  String? id;
  @JsonKey(name:'employeeId')
  String? employeeId;




  EmployeeCheckInModel({
    this.id,
    this.checkIn,
    this.employeeId,
    this.location,
    this.poupose
});

  factory EmployeeCheckInModel.fromJson(Map<String,dynamic> json)=>
      _$EmployeeCheckInModelFromJson(json);

  Map<String,dynamic> toJson()=> _$EmployeeCheckInModelToJson(this);
}