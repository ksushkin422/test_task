import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:static_map/static_map.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/hex_color.dart';
import '../controllers/custom_controller.dart';

class CustomView extends GetView<CustomController> {
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
            'Самовывоз',
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mapWidget(context),
              textFieldsWidget(context),
              buttonWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldsWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

  Widget mapWidget(BuildContext context) {
    return Container(
      child: Column(
        children: [

          ListTile(
            leading: Radio(value: 1, groupValue: 1, onChanged: (val){}),
            title: Text(
              'Адрес: г. Москва, ул.Ленина 17, оф.5',
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: hexToColor('#343235'),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          Container(
            child: StaticMapImage(
              options: StaticMapOptions(
                width: 350,
                height: 250,
                padding: 50,
                scale:2,
                overlays: [
                  const StaticMapMarker(
                    point: StaticMapLatLng(55.613991, 37.203158),
                    color: Color(0xffC21DB3),
                    size: 8,
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  Widget buttonWidget(BuildContext context) {
    return InkWell(
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
        Get.toNamed(Routes.SUCCESS_CUSTOM);
      },
    );
  }

}
