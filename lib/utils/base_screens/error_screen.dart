import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../hex_color.dart';

Widget errorScreen() {
  return Scaffold(
    backgroundColor: hexToColor('#F3F2F7'),
    body: const SingleChildScrollView(
      child: Center(
        child: Text(
          'Произошла ошибка, уже торопимся её решить',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22),
        ),
      ),
    ),
  );
}
