import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_task/utils/base_screens/loading_data_widget.dart';
import '../../../utils/hex_color.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          hexToColor('#FEF7FF'),
          hexToColor('#fefffe'),
          hexToColor('#deefe2'),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            'Корзина',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Manrope',
                color: hexToColor('#343235'),
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          centerTitle: true,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        body: Obx(
          () => (controller.isLoadingEvent.value)
              ? loaderView()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 450,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            (controller.cart.isNotEmpty)
                                ? orderList(context)
                                : Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Text(
                                      'Корзина пуста',
                                      style: TextStyle(
                                          fontFamily: 'Manrope',
                                          color: hexToColor('#343235'),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      alignment: Alignment.topLeft,
                      child: (controller.cart.isNotEmpty) ? itogoWidget(context) : SizedBox(),
                    ),
                    Container(height: 100, child: orderButton(context)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget itogoWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: ListTile(
            title: Text(
              'Стоимость доставки'.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            trailing: Text(
              'Бесплатно'.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: ListTile(
            title: Text(
              'Всего'.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            trailing: Text(
              '₽${controller.itogo_sum}'.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Widget orderList(BuildContext context) {
    return Column(
      children: [
        ...controller.cart
            .map((cart_item) => Column(
                  children: [cartItemWidget(context, cart_item), Divider()],
                ))
            .toList()
      ],
    );
  }

  Widget cartItemWidget(BuildContext context, item) {
    return Container(
        height: 180,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                height: 130,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                  // shape: BoxShape.rectangle,
                  image:
                      DecorationImage(image: NetworkImage('${item['image']}'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${item['name']}'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('${item['category'].image}'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            flex: 5,
                            child: Container(
                              child: Text(
                                '${item['category'].category_name}',
                                style: TextStyle(
                                    fontFamily: 'Manrope',
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${item['packaging_size']}'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        (item['count'] > 1)
                            ? '₽${item['packaging_price']}  *  ${item['count']}'.toUpperCase()
                            : '₽${item['packaging_price']}'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: IconButton(
                  onPressed: () {
                    controller.deleteFromCart(context, item);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.trash,
                    color: Colors.grey,
                  )),
            ),
          ],
        ));
  }

  Widget orderButton(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
            color: (controller.cart.isNotEmpty) ? hexToColor('#427a5b') : Colors.grey.shade300,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Text(
          'Оформить заказ',
          style: TextStyle(
              fontFamily: 'Manrope',
              color: (controller.cart.isNotEmpty) ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
      onTap: () {
        if (controller.cart.isNotEmpty) {
          controller.askToWay(context);
        }
      },
    );
  }
}
