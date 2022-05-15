import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:vizmo/constant/string_constant.dart';
import 'package:vizmo/screen_view/bottom_bar.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNextScreen();
  }

  void loadNextScreen() async{
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.to( ()=> BottomBar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:splashBody()
    );
  }

  Widget splashBody(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:const Center(
        child: Text(
          StringConstant.appName,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blueAccent,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
