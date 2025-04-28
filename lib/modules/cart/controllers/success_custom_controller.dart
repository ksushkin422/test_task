import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';
import 'package:test_task/modules/catalog/controllers/catalog_controller.dart';

import '../../../routes/app_pages.dart';


class SuccessCustomController extends GetxController {

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void goToStart(){
    CatalogController().cart.value = [];
    CatalogController().cart.refresh();
    GetStorage().writeInMemory('cart', []);
    Get.offAllNamed(Routes.CATALOG);
  }


  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void increment() => count.value++;
}
