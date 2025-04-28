import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/hex_color.dart';
import '../controllers/delivery_controller.dart';

class DeliveryView extends GetView<DeliveryController> {
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
            'Доставка',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Manrope',
                color: hexToColor('#343235'),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
          centerTitle: true,
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
            textForms(context),
            InkWell(
              child: Container(
                height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                    color: hexToColor('#427a5b'),
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
                Get.toNamed(Routes.SUCCESS_DELIVERY);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget textForms(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              'Укажите адрес доставки *',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: hexToColor('#343235'),
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade400),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              'Укажите контактный номер *',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: hexToColor('#343235'),
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade400),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey[50],
                prefixText: '+ 7 ',
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              'Комментарий',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: hexToColor('#343235'),
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade400),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
