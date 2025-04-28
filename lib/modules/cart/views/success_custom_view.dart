import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/hex_color.dart';
import '../controllers/custom_controller.dart';
import '../controllers/success_custom_controller.dart';

class SuccessCustomView extends GetView<SuccessCustomController> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            InkWell(
              child: Container(
                height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                    color: hexToColor('#427a5b'),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                  'Построить маршрут',
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              onTap: (){
              },
            )
          ],
        ),
      ),
    );
  }
}
