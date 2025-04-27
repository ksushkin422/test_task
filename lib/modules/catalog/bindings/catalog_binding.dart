import 'package:get/get.dart';

import '../controllers/catalog_controller.dart';
import '../controllers/detail_controller.dart';
import '../controllers/filter_controller.dart';

class CatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogController>(
      () => CatalogController(),
    );
    Get.lazyPut<FilterController>(
      () => FilterController(),
    );
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );

  }

}
