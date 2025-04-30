import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';
import 'package:test_task/db/firebase_repository.dart';
import 'package:test_task/db/response/categories_response.dart';
import '../../../db/response/products_response.dart';
import '../../../routes/app_pages.dart';

class CatalogController extends GetxController {
  final count = 0.obs;
  var isLoadingCategories = true.obs;
  var isLoadingProducts = true.obs;
  var categories = Rxn<CategoriesMainResponse>();
  List<CategoriesResponse> categs = [];
  var products = Rxn<ProductsMainResponse>();
  var products_for_filter = Rxn<ProductsMainResponse>();
  List<ProductsResponse> prods = [];
  var cart = [].obs;
  var filter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // getCategories();
    // getProducts();
    cart.value = GetStorage().read('cart');
    filter.value = GetStorage().read('filter');
    getCategoriesData();
    getProductsData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getCategoriesData() async {
    isLoadingCategories.value = true;
    categories.value = await FirebaseRepository().getCategoriesData();
    categs = categories.value!.data!;
    GetStorage().write('categories', categs);
    print(GetStorage().read('categories'));
    isLoadingCategories.value = false;
  }

  Future<void> getProductsData() async {
    isLoadingProducts.value = true;
    products.value = await FirebaseRepository().getProductsData();
    products_for_filter.value = products.value;
    prods = products.value?.data ?? [];
    isLoadingProducts.value = false;
  }

  void goToFilter() async {
    Get.toNamed(Routes.FILTER)?.then((val) async {
      filter.value = GetStorage().read('filter');
      filter.refresh();
      if (filter.value != 0) {
        products.value = await FirebaseRepository().getProductsDataFiltered(filter.value);
        products_for_filter.value?.data = products.value?.data;
      } else {
        products.value = await FirebaseRepository().getProductsData();
        products_for_filter.value?.data = products.value?.data;
      }
      products_for_filter.refresh();
    });
  }

  void goToCart() {
    Get.toNamed(Routes.CART)?.then((val) {
      cart.refresh();
    });
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
