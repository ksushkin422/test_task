import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_task/modules/catalog/controllers/catalog_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/hex_color.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: Badge(
                offset: Offset(-1, 2),
                backgroundColor: Colors.red,
                label: Obx(()=>Text('${controller.cart.length}'),),
                child: IconButton(onPressed: () {
                  Get.toNamed(Routes.CART);
                }, icon: Icon(Icons.shopping_cart_outlined)),
              ),
            )
          ],
          centerTitle: true,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              blockPhoto(context),
              blockNameInfo(context),
              blockPackVariants(context),
              blockDeskriptionTabs(context),
              blockAddToCart(context),
              blockOrderButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget blockPhoto(BuildContext context) {
    return Container(
      // height: 300,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Container(
                  height: 250,
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 1,
                    childAspectRatio: 1,
                    children: <Widget>[
                      ...controller.product_item['image']
                          .map((img_item) => mini_img(context, img_item))
                          .toList()
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 9,
            child: Column(
              children: [
                Obx(
                  () => Container(
                    height: 270,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('${controller.selected_image.value}'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mini_img(BuildContext context, img) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(5),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('${img}'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      onTap: () {
        controller.selectImage(context, img);
      },
    );
  }

  Widget blockNameInfo(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          '${controller.product_item['name']}',
          style: TextStyle(
              fontFamily: 'Manrope',
              color: hexToColor('#343235'),
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        subtitle: Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            '${GetStorage().read('categories').where((categ) => categ['id'] == controller.product_item['category_id']).toList()[0]['image']}'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 10,
                child: Container(
                  child: Text(
                    '${GetStorage().read('categories').where((categ) => categ['id'] == controller.product_item['category_id']).toList()[0]['category_name']}',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        color: hexToColor('#343235'),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget blockPackVariants(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 15),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Text(
              'Выбрать фасовку:',
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: hexToColor('#343235'),
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
          ),
          Flexible(
            flex: 4,
            child: Obx(
              () => Container(
                height: 50,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    ...controller.product.value['packaging']
                        .map((pack) => pack_item(context, pack))
                        .toList()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pack_item(BuildContext context, item) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (item['selected'] == 0) ? hexToColor('#FDFEFD') : Colors.black,
          border: Border.all(color: (item['selected'] == 0) ? Colors.black : Colors.grey, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Text(
          '${item['size']}',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Manrope',
              color: (item['selected'] == 1) ? Colors.white : hexToColor('#343235'),
              fontWeight: FontWeight.w300,
              fontSize: 18),
        ),
      ),
      onTap: () {
        controller.selectPackaging(context, item);
      },
    );
  }

  Widget blockDeskriptionTabs(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      // color: Colors.green,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 50,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Описание',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          color: hexToColor('#427a5b'),
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Состав',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          color: hexToColor('#427a5b'),
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    ),
                  ),
                ],
                indicatorColor: hexToColor('#427a5b'),
                unselectedLabelColor: Colors.grey,
              ),
            ),
            Container(
              height: 130,
              child: TabBarView(
                children: [
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      '${controller.product_item['description']}',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          color: hexToColor('#343235'),
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      '${controller.product_item['composition']}',
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          color: hexToColor('#343235'),
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget blockAddToCart(BuildContext context) {
    return Obx(
      () => Container(
        // height: 110,
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  '₽${controller.product.value['packaging'].where((item) => item['selected'] == 1).toList()[0]['price']}',
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      color: hexToColor('#343235'),
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
              ),
            ),
            Flexible(
              flex: 10,
              child: (controller.cart
                      .where((item) => item['product_id'] == controller.product['id'])
                      .isNotEmpty)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                controller.removeItem(context, controller.product);
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.circleMinus,
                                color: Colors.grey.shade300,
                                size: 30,
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '${controller.cart.where((item) => item['product_id'] == controller.product['id']).toList()[0]['count']}',
                              style: TextStyle(
                                  fontFamily: 'Manrope',
                                  color: hexToColor('#343235'),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24),
                            ),
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {
                                controller.addItem(context, controller.product);
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.circlePlus,
                                color: Colors.black,
                                size: 35,
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    )
                  : InkWell(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: hexToColor('#427a5b'),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Text(
                          'В корзину',
                          style: TextStyle(
                              fontFamily: 'Manrope',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                      onTap: () {
                        controller.addToCartFirst(
                            context,
                            controller.product.value['packaging']
                                .where((item) => item['selected'] == 1)
                                .toList()[0]);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget blockOrderButton(BuildContext context) {
    return Obx(
      () => InkWell(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: (controller.cart
                      .where((item) => item['product_id'] == controller.product['id'])
                      .isNotEmpty)
                  ? hexToColor('#427a5b')
                  : Colors.grey.shade400,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Text(
            'Заказать',
            style: TextStyle(
                fontFamily: 'Manrope',
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ),
        onTap: (){
          controller.goToCart();
        },
      ),
    );
  }
}
