import 'dart:convert';

import 'package:vizmo/model/checkin_model/employee_checkin_model.dart';
import 'package:http/http.dart' as http;
import 'package:vizmo/constant/string_constant.dart';

class ProfileRepository{

  //employeeCheckinData
  Future<List<EmployeeCheckInModel>> employeeList(int id) async{
    var result=await http.get(Uri.parse("${StringConstant.baseUrl}/${StringConstant.employee}/$id/${StringConstant.checkIn}"));
    List<EmployeeCheckInModel> listOfEmployee = (jsonDecode(result.body) as List)
        .map((itemWord) => EmployeeCheckInModel.fromJson(itemWord))
        .toList();
    return listOfEmployee;
  }
}