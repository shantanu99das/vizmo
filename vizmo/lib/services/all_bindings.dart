

import 'package:get/instance_manager.dart';
import 'package:vizmo/controller/home_controller.dart';
import 'package:vizmo/controller/profile_controller.dart';
import 'package:vizmo/repository/home_repository.dart';
import 'package:vizmo/repository/profile_repository.dart';

class AllBindings{
  void allBindingInitializer(){
      Get.lazyPut<HomeController>(() {
        return HomeController(homeRepository: HomeRepository());
        }
      );

      Get.lazyPut<ProfileController>(() {
        return ProfileController(profileRepository: ProfileRepository());
        }
      );
  }
}