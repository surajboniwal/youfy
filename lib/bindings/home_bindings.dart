import 'package:get/get.dart';
import 'package:spotifyclone/controllers/home_controller.dart';
import 'package:spotifyclone/controllers/hover_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HoverController());
    Get.put(HomeController());
  }
}
