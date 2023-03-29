import 'package:floor_test/Getx_Managment/Controllers/sdata_controller.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DataController>(() => DataController());
    // Get.lazyPut<ControllerX>(() => ControllerX());

  }


}