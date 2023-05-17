import 'package:flutter/material.dart';

import '../../Utils/custom_color.dart';

class InspectionTrackContainer extends StatelessWidget {
  const InspectionTrackContainer({Key? key}) : super(key: key);

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
                              "assets/images/search_image.png", width: 100, height: 100,),
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
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Track Pemeriksaan", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColor.primaryColor,
                    fontSize: 22)),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Kamu dapat mengecek progress\npemeriksaanmu disini",
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
                      "Track",
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
        ],
      ),
    );

  }
}
