import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';


class FilterController extends GetxController {

  final count = 0.obs;
  // var isLoading = true.obs;
  var categories = [].obs;
  var filter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    categories.value = GetStorage().read('categories');
    filter.value = GetStorage().read('filter');
  }

  @override
  void onReady() {
    super.onReady();
  }

  void changeFilter(BuildContext context, id){
    GetStorage().writeInMemory('filter', id);
    filter.value = id;
    categories.refresh();
    filter.refresh();
  }

  void dropFilter(){
    GetStorage().writeInMemory('filter', 0);
    filter.value = 0;
    categories.refresh();
    filter.refresh();
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
