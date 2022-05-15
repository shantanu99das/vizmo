import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vizmo/constant/string_constant.dart';
import 'package:vizmo/screen_view/home.dart';
import 'package:vizmo/screen_view/profile_view.dart';
import 'package:vizmo/services/all_bindings.dart';
import 'package:vizmo/services/bindings.dart';
import 'package:vizmo/util/view_util.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex=0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AllBindings().allBindingInitializer();
  }

  changeIndex(int index){
    setState(() {
      currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(

        elevation: 3.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5
            )
          ),
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20*4 ,bottom: 10,top: 10),
                child: InkWell(
                onTap: ()=>changeIndex(0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.home,
                    color: currentIndex==0?Colors.indigoAccent:Colors.grey,
                  ),
                ),
                 ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20*4,bottom: 10,top: 10),
                child: InkWell(
                  onTap: (){
                    if(StringConstant.userId!=''){
                      changeIndex(1);
                    }
                    else{
                          ViewUtil().showToasts("No user selected");
                    }

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.account_circle,
                      color: currentIndex==1?Colors.indigoAccent:Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: bottomBarUi(),
    );
  }

  Widget bottomBarUi(){
    return WillPopScope(
        child: (currentIndex==0)?Home():ProfileView(
          id: StringConstant.userId,
          imageUrl: StringConstant.imageUrl,
          name: StringConstant.name,
        ),
        onWillPop:()async{
          if(true){
            Fluttertoast.showToast(msg: "Press Back Once Again to Exit",
            backgroundColor: Colors.black,
            textColor: Colors.white);
          }
          return false;
    });
  }

  // bottomBarView(index)
  // {
  //   return InkWell(
  //     onTap: ()=>changeIndex(index),
  //     child: Padding(
  //       padding:const EdgeInsets.all(10.0*6),
  //       child: ,
  //     ),
  //   );
  //
  //
  // }
}
