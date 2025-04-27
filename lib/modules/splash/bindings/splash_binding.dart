import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import '../controllers/splash_second_controller.dart';


class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
            () => WelcomeController()
    );
    Get.lazyPut(
            () => WelcomeSecondController()
    );

  }
}
