import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizmo/constant/string_constant.dart';
import 'package:vizmo/screen_view/splash_screen.dart';
import 'package:vizmo/services/all_bindings.dart';
import 'package:vizmo/services/bindings.dart';
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigationKey=GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    AllBindings().allBindingInitializer();
    return GetMaterialApp(
      navigatorKey: navigationKey,
      title: StringConstant.appName,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      home:const SplashScreen(),
    );
  }
}
