import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:static_map/static_map.dart';
import 'package:test_task/routes/app_pages.dart';
import 'package:test_task/utils/base_screens/error_screen.dart';
import 'package:test_task/utils/hex_color.dart';
import 'app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  StaticMap.initialize(apiKey: 'pk_287d4ff2cbe047d794c97a33fe7f5c86');
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return (kDebugMode)
        ? SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          color: Colors.black87,
          child: SelectableText(
            details.toString(),
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    )
        : errorScreen();
  };
  runApp(
    GetMaterialApp(
      title: "test_task",
      initialRoute: AppPages.WELCOME,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      // builder: EasyLoading.init(),
      initialBinding: AppBinding(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ru'),
      ],
    ),
  );
}

// void configLoading() {
//   EasyLoading.instance
//     ..indicatorType = EasyLoadingIndicatorType.threeBounce
//     ..loadingStyle = EasyLoadingStyle.custom
//     ..radius = 10.0
//     ..backgroundColor = Colors.grey.shade200
//     ..indicatorColor = hexToColor('#2B2B2B')
//     ..textColor = hexToColor('#2B2B2B')
//     ..userInteractions = false
//     ..dismissOnTap = false
//     ..animationStyle = EasyLoadingAnimationStyle.scale;
// }
