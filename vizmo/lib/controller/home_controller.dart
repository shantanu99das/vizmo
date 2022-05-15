import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vizmo/model/employee_model.dart';
import 'package:vizmo/repository/home_repository.dart';

class HomeController extends GetxController{
  final HomeRepository? homeRepository;
  HomeController({@required this.homeRepository}):assert(homeRepository!=null);
  List<EmployeeModel> employeeList=[];
  var loading=false.obs;

  //getting employee list from homeRepository
  Future<List<EmployeeModel>> getEmployeeList(int page) async{
    loading(true);
  var employee=await homeRepository!.employeeList(page);
    employeeList.addAll(employee);
   employeeList.sort((a,b){
     // if(int.parse(a.id!) != null && int.parse(b.id!) != null&&int.parse(a.id!).compareTo(int.parse(b.id!))!=0){
     //   return int.parse(a.id!).compareTo(int.parse(b.id!));
     // }if{
       return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
    // }
   });

    loading(false);
   return employeeList;
  }


}