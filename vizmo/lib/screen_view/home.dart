import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:vizmo/constant/string_constant.dart';
import 'package:vizmo/controller/home_controller.dart';
import 'package:vizmo/model/employee_model.dart';
import 'package:vizmo/screen_view/profile_view.dart';
import 'package:vizmo/services/all_bindings.dart';
import 'package:vizmo/services/bindings.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController get homeController => Get.find();
  int? page=1;
  ScrollController scrollController=ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(_scrollListener);
    super.initState();
    AllBindings().allBindingInitializer();
    print("initalize");
    getEmployeeList();
  }

  void _scrollListener() async{
    if(scrollController.offset>=scrollController.position.maxScrollExtent&&
    !scrollController.position.outOfRange){
      page=page!+1;
      await homeController.getEmployeeList(page!);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(StringConstant.home,),
        automaticallyImplyLeading: false,
      ),
      body: homeUI(context),
    );
  }

  Widget homeUI(BuildContext context){
   return Stack(
     children: [
       CustomScrollView(
         physics: const BouncingScrollPhysics(),
         slivers: [
           SliverList(delegate: SliverChildListDelegate([
             Obx((){
               return ModalProgressHUD(inAsyncCall: homeController.loading.value,
                   child: Column(
                     children: [
                       listUI(context),
                       Visibility(
                         visible: homeController.loading.value,
                         child: Container(
                           color: Colors.transparent,
                           child: const Align(
                             alignment: Alignment.topCenter,
                             child: CircularProgressIndicator(
                               strokeWidth: 4.0,
                               color: Colors.blue,

                             ),
                           ),
                         ),)
                     ],
                   ));
             })
           ]))
         ],
       )
     ],
   );
  }

  // Widget fetchinglistView(BuildContext context){
  //   return FutureBuilder(
  //     future: homeController.getEmployeeList(page!),
  //       builder: (BuildContext context,AsyncSnapshot<List<EmployeeModel>> snapshot){
  //       if(!snapshot.hasData){
  //         return Container(
  //           height: MediaQuery.of(context).size.height,
  //           child: Center(
  //             child: CircularProgressIndicator(
  //               color: Colors.blue,
  //
  //             ),
  //           ),
  //         );
  //       }
  //       else{
  //         return listUI(snapshot.data);
  //       }
  //
  //       });
  //
  // }
  
  Widget listUI(BuildContext context){
     return Padding(
       padding:const EdgeInsets.only(bottom: 0.0),
       child: Container(
         height: MediaQuery.of(context).size.height-180,
         child: ListView.builder(
           controller: scrollController,
           physics: BouncingScrollPhysics(),
           scrollDirection: Axis.vertical,
           shrinkWrap: true,
             itemCount: homeController.employeeList.length,
           itemBuilder: (BuildContext context,int index){
               return InkWell(
                 onTap: (){

                     StringConstant.userId = homeController.employeeList[index].id!;
                     StringConstant.imageUrl = homeController.employeeList[index].avatar!;
                     StringConstant.name = homeController.employeeList[index].name!;
                      print(StringConstant.userId);
                   Get.to(ProfileView(
                     id: homeController.employeeList[index].id,
                     name: homeController.employeeList[index].name,
                     imageUrl: homeController.employeeList[index].avatar,
                   ));
                 },
                 child: Container(
                  // height: 50,
                   decoration: BoxDecoration(
                     border: Border.all(
                       width: 1,
                       color: Colors.blueGrey
                     )

                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(top: 20.0,bottom: 20.0,left: 4.0,right: 4.0),
                     child: Row(
                       children: [
                         Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(24.0)
                           ),
                           child: ClipRRect(
                             borderRadius: BorderRadius.circular(24.0),
                             child: Image.network(
                               homeController.employeeList[index].avatar!,
                               height: 30.0,
                               width: 30.0,
                             ),
                           ),
                         ),

                         Text(homeController.employeeList[index].name!,
                         textAlign: TextAlign.center),
                       ],
                     ),
                   ),
                 ),
               );
           },
         ),
            
       ),
             
     ); 
  }
  void getEmployeeList() async{
   await homeController.getEmployeeList(page!);
  }
}
