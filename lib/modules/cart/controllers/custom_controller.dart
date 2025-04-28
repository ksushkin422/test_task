import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';
import 'package:static_map/static_map.dart';


class CustomController extends GetxController {

  final count = 0.obs;



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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void increment() => count.value++;
}
