import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vizmo/model/checkin_model/employee_checkin_model.dart';

import '../repository/profile_repository.dart';

class ProfileController extends GetxController{
  final ProfileRepository? profileRepository;
  ProfileController({@required this.profileRepository}):assert(profileRepository!=null);

  var loading=false.obs;
  List<EmployeeCheckInModel>? employeeCheckInList=[];

  Future<List<EmployeeCheckInModel>?> checkInData(String userId) async{
    loading(true);
    employeeCheckInList=await profileRepository!.employeeList(int.parse(userId));
    loading(false);
    return employeeCheckInList;
  }
}