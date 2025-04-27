import 'package:get/get.dart';
import 'package:test_task/modules/cart/controllers/custom_controller.dart';
import 'package:test_task/modules/cart/controllers/delivery_controller.dart';
import 'package:test_task/modules/cart/controllers/success_custom_controller.dart';
import 'package:test_task/modules/cart/controllers/success_delivery_controller.dart';

import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<DeliveryController>(
      () => DeliveryController(),
    );
    Get.lazyPut<CustomController>(
      () => CustomController(),
    );
    Get.lazyPut<SuccessCustomController>(
      () => SuccessCustomController(),
    );
    Get.lazyPut<SuccessDeliveryController>(
      () => SuccessDeliveryController(),
    );

  }

}
