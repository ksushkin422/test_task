import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class CatalogController extends GetxController {
  final count = 0.obs;
  var isLoadingCategories = true.obs;
  var isLoadingProducts = true.obs;
  var categories = [].obs;
  var products = [].obs;
  var products_for_filter = [].obs;
  var cart = [].obs;
  var filter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getProducts();
    cart.value = GetStorage().read('cart');
    filter.value = GetStorage().read('filter');
  }

  @override
  void onReady() {
    super.onReady();
  }

  void goToFilter() {
    Get.toNamed(Routes.FILTER)?.then((val) {
      filter.value = GetStorage().read('filter');
      filter.refresh();
      if (filter.value!=0){
        products_for_filter.value = products.value.where((product_item)=>product_item['category_id']==filter.value).toList();
      } else {
        products_for_filter.value = products.value;
      }
    });
  }

  void goToCart(){
    Get.toNamed(Routes.CART)?.then((val){cart.refresh();});
  }

  void getCategories() async {
    isLoadingCategories.value = true;
    final String jsonString = await rootBundle.loadString('assets/data/categories.json');
    categories.value = jsonDecode(jsonString);
    GetStorage().write('categories', categories);
    print(categories);
    isLoadingCategories.value = false;
  }

  void getProducts() async {
    isLoadingProducts.value = true;
    final String jsonString = await rootBundle.loadString('assets/data/product.json');
    products.value = jsonDecode(jsonString);
    products_for_filter.value = jsonDecode(jsonString);
    print(products);
    isLoadingProducts.value = false;
  }

  void detailProduct(BuildContext context, product) {
    GetStorage().write('product_item', product);
    Get.toNamed(Routes.DETAIL)?.then((val) {
      cart.refresh();
    });
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
