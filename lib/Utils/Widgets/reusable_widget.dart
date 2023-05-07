import 'package:flutter/material.dart';
import 'package:latihan_ui/Utils/custom_color.dart';

class ResUseAbleWidget {


  Widget primaryColorText(String text) {
    return Text(text, style: TextStyle(color: CustomColor.primaryColor, fontSize: 16, fontWeight: FontWeight.bold));
  }

}