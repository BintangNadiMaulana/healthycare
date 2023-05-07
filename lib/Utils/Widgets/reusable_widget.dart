import 'package:flutter/material.dart';
import 'package:latihan_ui/Utils/custom_color.dart';

class ResUseAbleWidget {


  Widget primaryColorText(String text) {
    return Text(text, style: TextStyle(color: CustomColor.primaryColor, fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget customForm(TextEditingController controller, String hintText){
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              hintText: hintText
          ),
        ),
      ),
    );
  }

  Widget customMainButton(String text, VoidCallback function) {
    return Container(
      height: 48,
      margin: EdgeInsets.only(right: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
          onPressed: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(flex: 1, child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),
              Icon(Icons.arrow_forward, color: Colors.white,)
            ],
          )),
    );
  }

}