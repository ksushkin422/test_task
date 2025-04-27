import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';

class WelcomeController extends GetxController {

  final count = 0.obs;

  var progress = 0.0.obs;
  var isLoading = true.obs;
  List cart = [];


  @override
  void onInit() {
    super.onInit();
    GetStorage().write('cart', cart);
    GetStorage().write('filter', 0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void next() {
    Get.offAllNamed(
      Routes.WELCOME_SECOND,
    );
  }

  void goToBase() {
    Get.offNamed(
      Routes.BASE,
    );
  }

  void goToAuth() {
    Get.offNamed(
      Routes.AUTH,
    );
  }
}
