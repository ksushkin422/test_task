import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/utils/hex_color.dart';
import '../controllers/splash_controller.dart';

class WelcomeView extends StatelessWidget {
  final WelcomeController controller = Get.put(WelcomeController());

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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            height: 226,
            width: 226,
            child: Image.asset('assets/images/noto_potted-plant.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              'Добро пожаловать',
              style: TextStyle(
                  fontFamily: 'Manrope',
                  color: hexToColor('#343235'),
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin et ь',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: hexToColor('#343235'),
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/icons/button.png'))
                    ),
                  ),
                  onTap: (){
                    controller.next();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
