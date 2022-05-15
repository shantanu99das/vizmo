import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vizmo/constant/string_constant.dart';
import 'package:vizmo/model/employee_model.dart';

class HomeRepository{

  Future<List<EmployeeModel>> employeeList(int page) async{
    var result=await http.get(Uri.parse("${StringConstant.baseUrl}/${StringConstant.employee}?page=$page&limit=${10}"));
    List<EmployeeModel> listOfEmployee = (jsonDecode(result.body) as List)
        .map((itemWord) => EmployeeModel.fromJson(itemWord))
        .toList();
   return listOfEmployee;
  }
}