import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:vizmo/services/all_bindings.dart';

class InitialBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    AllBindings().allBindingInitializer();
  }

}