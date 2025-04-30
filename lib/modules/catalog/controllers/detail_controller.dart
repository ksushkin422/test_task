import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';
import 'package:test_task/db/response/products_response.dart';

import '../../../routes/app_pages.dart';


class DetailController extends GetxController {

  final count = 0.obs;
  ProductsResponse product_item = GetStorage().read('product_item');
  var selected_image = ''.obs;
  var product = Rxn<ProductsResponse>();
  var cart = [].obs;

  @override
  void onInit() {
    super.onInit();
    selected_image.value = product_item.image?.first;
    product.value = product_item;
    setPackaging();
    inititalSetPackaging();
    cart.value = GetStorage().read('cart');
  }

  @override
  void onReady() {
    super.onReady();
  }

  void selectImage(BuildContext context, img) {
    selected_image.value = img;
  }

  void setPackaging() {
    product.value?.packaging?.forEach((pack){
      pack.selected = 0;
    });
  }

  void inititalSetPackaging() {
    product.value?.packaging?.first.selected=1;
  }

  void selectPackaging(BuildContext context, Packaging item) {
    setPackaging();
    product.value?.packaging?.where((pack)=>pack.id==item.id).toList()[0].selected=1;
    product.refresh();
  }

  void addToCartFirst(BuildContext context, Packaging packaging_item){
    cart.add(
      {
        "product_id": product_item.id,
        "packaging_id": packaging_item.id,
        "packaging_size": packaging_item.size,
        "packaging_price": packaging_item.price,
        "count": 1,
        "name": product.value?.name,
        "image": product.value?.image?[0],
        "category": GetStorage().read('categories').where((categ) => categ['id'] == product_item.category_id).toList()[0],
      }
    );
    GetStorage().writeInMemory('cart', cart);
  }

  void goToCart(){
    Get.toNamed(Routes.CART)?.then((val){cart.refresh();});
  }

  void removeItem(BuildContext context, item){
    var selected = product.value?.packaging?.where((item) =>
    item.selected == 1).toList()[0].id;
    var item_in_cart = cart.where((prod_item)=>prod_item['product_id']==item['id']&&prod_item['packaging_id']==selected).toList()[0];
    if (item_in_cart['count']>1){
      cart.where((prod_item)=>prod_item['product_id']==item['id']&&prod_item['packaging_id']==selected).toList()[0]['count']--;
    } else {
      cart.remove(item_in_cart);
    }
    GetStorage().writeInMemory('cart', cart);
    product.refresh();
    cart.refresh();
  }

  void addItem(BuildContext context, ProductsResponse? item_product){
    var selected = product.value?.packaging?.where((Packaging item) =>
    item.selected == 1).toList()[0].id;
    cart.where((prod_item)=>prod_item['product_id']==item_product?.id&&prod_item['packaging_id']==selected).toList()[0]['count']++;
    GetStorage().writeInMemory('cart', cart);
    product.refresh();
    cart.refresh();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void increment() => count.value++;
}
