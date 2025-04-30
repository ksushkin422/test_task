import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../db/response/products_response.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/base_screens/loading_data_widget.dart';
import '../../../utils/hex_color.dart';
import '../controllers/catalog_controller.dart';

class CatalogView extends GetView<CatalogController> {
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
              controller.goToFilter();
            },
            icon: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/icons/noun-filter-4547015 1.png'))),
            ),
          ),
          title: Text(
            'Каталог товаров',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Manrope',
                color: hexToColor('#343235'),
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          actions: [
            Obx(()=>Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: Badge(
                offset: Offset(-1, 2),
                backgroundColor: Colors.red,
                label: Text('${controller.cart.length}'),
                child: IconButton(onPressed: () {
                  controller.goToCart();
                }, icon: Icon(Icons.shopping_cart_outlined)),
              ),
            ),),
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
              Obx(
                () => (controller.isLoadingProducts.value == true)
                    ? loaderView()
                    : readyWidget(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget readyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Obx(()=>Column(
        children: [(controller.filter.value!=0)?breadCrumbs(context):SizedBox(), countProducts(context), productsGrid(context)],
      ),
      ),
    );
  }

  Widget breadCrumbs(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 25),
        child: BreadCrumb(
          items: <BreadCrumbItem>[
            BreadCrumbItem(
              content: Text(
                '${controller.categories.value?.data?.where((cat_item)=>cat_item.id==controller.filter.value).toList()[0].category_name}',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    color: hexToColor('#343235'),
                    fontWeight: FontWeight.w300,
                    fontSize: 18),
              ),
            ),
          ],
          divider: Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ));
  }

  Widget countProducts(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        'Всего: ${controller.products.value?.data?.length}',
        textAlign: TextAlign.right,
        style: TextStyle(
            fontFamily: 'Manrope',
            color: hexToColor('#343235'),
            fontWeight: FontWeight.w700,
            fontSize: 18),
      ),
    );
  }

  Widget productsGrid(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        axisDirection: AxisDirection.down,
        children: [
          ...?controller.products_for_filter.value?.data?.map(
                (product) => productCard(context, product),
              )
              .toList()
        ],
      ),
    );
  }

  Widget productCard(BuildContext context, ProductsResponse product) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1.7,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: hexToColor('#FFFFFF'),
            boxShadow: [
              BoxShadow(
                color: Colors.green.shade50,
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('${product.image![0]}'), fit: BoxFit.cover,),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  '${product.name}'.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      color: hexToColor('#343235'),
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            '${controller.categories.value?.data?.where((categ) => categ.id == product.category_id).toList()[0].image}',
                          ),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  title: Text(
                    '${controller.categories.value?.data?.where((categ) => categ.id == product.category_id).toList()[0].category_name}',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        color: hexToColor('#343235'),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: hexToColor('#427a5b'),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                  'Подробнее',
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          controller.detailProduct(context, product);
        },
      ),
    );
  }
}
