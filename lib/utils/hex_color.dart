import 'dart:ui';

import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

getMarkColor(mark) {
  Color mark_color = hexToColor('#8067F8');
  switch (mark) {
    case '2' || 2:
      mark_color = Colors.red;
      break;
    case '3' || 3:
      mark_color = Colors.orange;
      break;
    case '4' || 4:
      mark_color = hexToColor('#638EEF');
      break;
    case '5' || 5:
      mark_color = hexToColor('#7BC649');
      break;
  }
  return mark_color;
}