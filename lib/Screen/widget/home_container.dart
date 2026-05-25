import 'package:flutter/material.dart';
import '../../Utils/Widgets/reusable_widget.dart';
import '../../Utils/custom_color.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white,
            Colors.white,
            CustomColor.greyGradient,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RichText(
                  text: TextSpan(
                    text: 'Solusi, ',
                    style: TextStyle(
                      color: CustomColor.primaryColor,
                      fontSize: 22,
                    ),
                    children: [
                      TextSpan(
                        text: 'Kesehatan Anda',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColor.primaryColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Update informasi seputar kesehatan\nsemua bisa disini !",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: CustomColor.secondaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Informasi kesehatan akan segera hadir"),
                        backgroundColor: CustomColor.primaryColor,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Selengkapnya",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            width: 120,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 10,
                  right: 10,
                  top: -30,
                  left: 10,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/calendar_image.png",
                        width: 100,
                        height: 100,
                      ),
                      ReusableWidget().indicatorDots(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
