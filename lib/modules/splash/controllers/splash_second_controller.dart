import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class WelcomeSecondController extends GetxController {

  final count = 0.obs;

  var progress = 0.0.obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
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
      Routes.CATALOG,
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
