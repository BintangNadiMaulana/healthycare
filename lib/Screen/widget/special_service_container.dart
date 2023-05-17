import 'package:flutter/material.dart';

import '../../Utils/custom_color.dart';

class SpecialServiceContainer extends StatelessWidget {
  const SpecialServiceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Layanan Khusus", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColor.primaryColor,
                    fontSize: 22)),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Tes Covid 19, Cegah Corona\nSedini Mungkin",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: CustomColor.secondaryColor),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: const [
                     Text(
                      "Daftar Tes",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: CustomColor.primaryColor,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_forward, color: CustomColor.primaryColor)
                  ],
                )
              ],
            ),
          ),
          Container(
              height: 120,
              width: 120,
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      bottom: 10,
                      right: 10,
                      top: -40,
                      left: 10,
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/vaccine_image.png", width: 100, height: 100,),
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              ))
        ],
      ),
    );

  }
}
