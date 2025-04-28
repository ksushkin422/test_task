import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/hex_color.dart';

class CartController extends GetxController {
  final count = 0.obs;
  var isLoadingEvent = true.obs;
  var cart = [].obs;
  var itogo_sum = 0.obs;

  @override
  void onInit() {
    super.onInit();
    cart.value = GetStorage().read('cart');
    calculateItogo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void calculateItogo() {
    cart.forEach((cart_item) {
      itogo_sum += cart_item['packaging_price'] * cart_item['count'];
      print('itogo_sum');
      print(itogo_sum);
    });
  }

  void deleteFromCart(BuildContext context, item) {
    cart.remove(item);
    cart.refresh();
    GetStorage().writeInMemory('cart', cart);
  }

  Future askToWay(BuildContext context) {
    return Get.dialog(
      barrierDismissible: true,
      barrierColor: Colors.grey.withOpacity(.6),
      AlertDialog(
        title: Text(
          'Как вы хотите забрать товар?',
          style: TextStyle(
              fontFamily: 'Manrope',
              color: hexToColor('#343235'),
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
        actions: [
          InkWell(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: hexToColor('#427a5b'),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Text(
                'Доставка',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            onTap: () {
              Get.toNamed(Routes.DELIVERY);
            },
          ),
          InkWell(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300, borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Text(
                'Самовывоз',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            onTap: () {
              Get.toNamed(Routes.CUSTOM);
            },
          ),
        ],
      ),
    );
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
