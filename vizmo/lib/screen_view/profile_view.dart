import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:vizmo/constant/string_constant.dart';
import 'package:vizmo/controller/profile_controller.dart';
import 'package:vizmo/model/checkin_model/employee_checkin_model.dart';
import 'package:vizmo/services/all_bindings.dart';
import 'package:vizmo/services/bindings.dart';
class ProfileView extends StatefulWidget {
  String? id;
  String? imageUrl;
  String? name;
  ProfileView({Key? key,this.name,this.imageUrl,this.id}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController get profileController => Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AllBindings().allBindingInitializer();
    getProfileData(widget.id);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          StringConstant.profile
        ),
        automaticallyImplyLeading: false,

      ),
      body: profileViewUi(),
    );
  }

  Widget profileViewUi(){
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
              Obx((){
                return ModalProgressHUD(inAsyncCall: profileController.loading.value,
                    child: profileView(context));
              })
            ]))
          ],
        )
      ],
    );
  }

  Widget profileView(BuildContext context){
    return Container(
      child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(
                        StringConstant.imageUrl,
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: Center(
                  child: Text(StringConstant.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,

                    ),),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
            child: Text(widget.id!),),
            const Padding(
              padding:EdgeInsets.all(10),
              child: Text("UserCheckInList",
                textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
            if(!profileController.loading.value)
            listViewBuilder()
          ],
      ),
    );
  }



  Widget listViewBuilder(){
    return Padding(
        padding: EdgeInsets.only(bottom: 10,top: 10),
        child: ListView.builder(
           shrinkWrap: true,
          itemCount: profileController.employeeCheckInList!.length,
          itemBuilder: (BuildContext context,int index){
             var item=profileController.employeeCheckInList![index];
             return customCard(item);

          },
        ),
    );
  }

  Widget customCard(EmployeeCheckInModel item){
    return Container(
      margin:const EdgeInsets.only(bottom: 20.0,left: 10.0,right: 10.0,top: 20.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
           blurRadius: 4.0,
           spreadRadius: 1.0,
           color: Colors.black.withOpacity(0.05),
        ),]

      ),
      child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("ChechIn: ",textAlign: TextAlign.left,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,

              ),),
              Text(item.checkIn!,textAlign: TextAlign.left,style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,

              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Location: ",textAlign: TextAlign.left,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,

              ),),
              Text(item.location!,textAlign: TextAlign.left,style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,

              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("ID: ",textAlign: TextAlign.left,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,

              ),),
              Text(item.id!,textAlign: TextAlign.left,style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,

              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("EmployeeID: ",textAlign: TextAlign.left,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,

              ),),
              Text(item.employeeId!,textAlign: TextAlign.left,style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,

              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const Text("Pourpose: ",textAlign: TextAlign.left,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,

              ),),
              SizedBox(
                width: MediaQuery.of(context).size.width/1.5,
                child: Text(item.poupose!,textAlign: TextAlign.left,style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,

                ),),
              )
            ],
          ),

        ],
      ),
    );
  }

  void getProfileData(String? id) async{
    print(widget.id);
    await profileController.checkInData(id!);
  }
}
