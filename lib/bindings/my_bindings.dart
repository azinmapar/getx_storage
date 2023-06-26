import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }
}
