import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/hex_color.dart';
import '../controllers/custom_controller.dart';
import '../controllers/success_custom_controller.dart';
import '../controllers/success_delivery_controller.dart';

class SuccessDeliveryView extends GetView<SuccessDeliveryController> {
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
          leading: SizedBox(),
          actions: [
            IconButton(onPressed: (){
              controller.goToStart();
            }, icon: FaIcon(FontAwesomeIcons.xmark, color: Colors.grey,))
          ],
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.only(top: 200),
              // height: 226,
              // width: 226,
              child: Image.asset('assets/images/support (1) 1.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Заказ оформлен успешно',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    color: hexToColor('#343235'),
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
