import 'package:get/get.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/cart/views/custom_view.dart';
import '../modules/cart/views/delivery_view.dart';
import '../modules/cart/views/success_custom_view.dart';
import '../modules/cart/views/success_delivery_view.dart';
import '../modules/catalog/bindings/catalog_binding.dart';
import '../modules/catalog/views/catalog_view.dart';
import '../modules/catalog/views/detail_view.dart';
import '../modules/catalog/views/filter_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_second_view.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BASE;
  static const AUTHORIZ = Routes.AUTH;
  static const WELCOME = Routes.WELCOME;

  static final routes = [

    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
        children: [
          GetPage(name: Routes.PROFILE, page:  () =>  ProfileView()),
        ]
    ),

    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
        children: [
          GetPage(name: Routes.CART, page:  () =>  CartView()),
        ]
    ),

    GetPage(
      name: _Paths.DELIVERY,
      page: () => DeliveryView(),
      binding: CartBinding(),
        children: [
          GetPage(name: Routes.DELIVERY, page:  () =>  DeliveryView()),
        ]
    ),
    GetPage(
      name: _Paths.SUCCESS_DELIVERY,
      page: () => SuccessDeliveryView(),
      binding: CartBinding(),
        children: [
          GetPage(name: Routes.SUCCESS_DELIVERY, page:  () =>  SuccessDeliveryView()),
        ]
    ),

    GetPage(
      name: _Paths.CUSTOM,
      page: () => CustomView(),
      binding: CartBinding(),
        children: [
          GetPage(name: Routes.CUSTOM, page:  () =>  CustomView()),
        ]
    ),
    GetPage(
      name: _Paths.SUCCESS_CUSTOM,
      page: () => SuccessCustomView(),
      binding: CartBinding(),
        children: [
          GetPage(name: Routes.SUCCESS_CUSTOM, page:  () =>  SuccessCustomView()),
        ]
    ),


    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
      children: [
        GetPage(name: Routes.WELCOME, page:  () =>  WelcomeView())
      ]
    ),
    GetPage(
      name: _Paths.WELCOME_SECOND,
      page: () => WelcomeSecondView(),
      binding: WelcomeBinding(),
      children: [
        GetPage(name: Routes.WELCOME_SECOND, page:  () =>  WelcomeSecondView())
      ]
    ),
    GetPage(
      name: _Paths.CATALOG,
      page: () => CatalogView(),
      binding: CatalogBinding(),
      children: [
        GetPage(name: Routes.CATALOG, page:  () =>  CatalogView())
      ]
    ),
    GetPage(
      name: _Paths.FILTER,
      page: () => FilterView(),
      binding: CatalogBinding(),
      children: [
        GetPage(name: Routes.FILTER, page:  () =>  FilterView())
      ]
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: CatalogBinding(),
      children: [
        GetPage(name: Routes.DETAIL, page:  () =>  DetailView())
      ]
    ),





  ];
}