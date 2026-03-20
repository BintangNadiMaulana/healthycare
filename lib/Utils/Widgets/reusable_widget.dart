import 'package:flutter/material.dart';
import 'package:healthycare/Utils/custom_color.dart';

class ReusableWidget {
  Widget primaryColorText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: CustomColor.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget customForm(TextEditingController controller, String hintText) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x809E9E9E),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }

  Widget customFormPassword(
    TextEditingController controller,
    String hintText,
    VoidCallback? function,
    bool showPassword,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x809E9E9E),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          obscureText: showPassword,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: function,
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }

  Widget btnMain(String text, VoidCallback function) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(right: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget btnPrimaryCustomIcon(
    String text,
    VoidCallback function,
    String iconAssets,
  ) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(right: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Image.asset(iconAssets),
          ],
        ),
      ),
    );
  }

  Widget indicatorDots() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
