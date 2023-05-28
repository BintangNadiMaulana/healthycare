import 'package:flutter/material.dart';
import 'package:latihan_ui/Screen/widget/home_container.dart';
import 'package:latihan_ui/Screen/widget/inspection_track_container.dart';
import 'package:latihan_ui/Screen/widget/special_service_container.dart';
import 'package:latihan_ui/Utils/custom_color.dart';

import '../Utils/Widgets/reusable_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("assets/icon/icon_navigator.png"),
        actions: [
          Image.asset("assets/icon/icon_trolly.png"),
          Image.asset("assets/icon/icon_bell.png"),
        ],
      ),
      body: homeBody(context),
    );
  }

  Widget homeBody(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          HomeContainer(),
          SpecialServiceContainer(),
          InspectionTrackContainer(),

          // search section
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 30, top: 20),
                padding: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Image.asset("assets/icon/icon_filter.png"),
              ),
              Container(
                width: 265,
                  child: ResUseAbleWidget().customForm(searchController, "Search")),

            ],

          ),
          // list kategori
          Container(
            margin: EdgeInsets.only(top: 47),
            height: 40,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: CustomColor.primaryColor,
                  ),
                  height: 30,
                  child: Center(child: Text("All Product", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                  ),
                  height: 30,
                  child: Center(child: Text("Layanan Kesehatan", style: TextStyle(color: CustomColor.primaryColor, fontSize: 12, fontWeight: FontWeight.w700),)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                  ),
                  height: 30,
                  child: Center(child: Text("Alat Kesehatan", style: TextStyle(color: CustomColor.primaryColor, fontSize: 12, fontWeight: FontWeight.w700),)),
                ),
              ],

            ),
          ),
          // list produk
          Container(
            margin: EdgeInsets.only(top: 26),
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal ,
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Center(child: Image.asset("assets/images/mikroskop_image.png")),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12, left: 10),
                              child: Text("Suntik Steril", style: TextStyle(color: CustomColor.secondaryColor, fontSize: 17, fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 22, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8, left: 10),
                                    child:
                                    Text("Rp 10.000", style: TextStyle(color: CustomColor.orange, fontSize: 12, fontWeight: FontWeight.w600)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    padding: EdgeInsets.only(top: 3, left: 5, bottom: 3, right: 5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: CustomColor.greenBackground),
                                    child:
                                    Center(child: Text("Ready Stock", style: TextStyle(color: CustomColor.green, fontSize: 10, fontWeight: FontWeight.w600))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Center(child: Image.asset("assets/images/mikroskop_image.png")),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12, left: 10),
                              child: Text("Suntik Steril", style: TextStyle(color: CustomColor.secondaryColor, fontSize: 17, fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 22, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8, left: 10),
                                    child:
                                    Text("Rp 10.000", style: TextStyle(color: CustomColor.orange, fontSize: 12, fontWeight: FontWeight.w600)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    padding: EdgeInsets.only(top: 3, left: 5, bottom: 3, right: 5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: CustomColor.greenBackground),
                                    child:
                                    Center(child: Text("Ready Stock", style: TextStyle(color: CustomColor.green, fontSize: 10, fontWeight: FontWeight.w600))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Center(child: Image.asset("assets/images/mikroskop_image.png")),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12, left: 10),
                              child: Text("Suntik Steril", style: TextStyle(color: CustomColor.secondaryColor, fontSize: 17, fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 22, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8, left: 10),
                                    child:
                                    Text("Rp 10.000", style: TextStyle(color: CustomColor.orange, fontSize: 12, fontWeight: FontWeight.w600)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    padding: EdgeInsets.only(top: 3, left: 5, bottom: 3, right: 5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: CustomColor.greenBackground),
                                    child:
                                    Center(child: Text("Ready Stock", style: TextStyle(color: CustomColor.green, fontSize: 10, fontWeight: FontWeight.w600))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // text pilih tipe layanan
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 30, left: 20),
            child: ResUseAbleWidget().primaryColorText("Pilih Tipe Layanan Kesehatan Anda"),
          ),

          Container(
            margin: EdgeInsets.only(top: 40, bottom: 30, left: 20),
            child:
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PCR Swab Test (Drive Thru)\nHasil 1 Hari Kerja", style: TextStyle(color: CustomColor.primaryColor, fontSize: 14, fontWeight: FontWeight.w600), maxLines: 2,),
                      SizedBox(height: 12,),
                      Text("Rp 1.400.000", style: TextStyle(color: CustomColor.orange, fontSize: 14, fontWeight: FontWeight.w600)),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset("assets/icon/icon_gedung.png"),
                            ),
                            Text("Lenmarc Surabaya", style: TextStyle(color: CustomColor.greyColor, fontSize: 14, fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset("assets/icon/icon_location.png"),
                            ),
                            Text("Dukuh Pakis, Surabaya", style: TextStyle(color: CustomColor.primaryColor, fontSize: 12, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                      child: Expanded(child: Image.asset("assets/images/hospital1_image.png"))),
                ),

              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 40, bottom: 30, left: 20),
            child:
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PCR Swab Test (Drive Thru)\nHasil 1 Hari Kerja", style: TextStyle(color: CustomColor.primaryColor, fontSize: 14, fontWeight: FontWeight.w600), maxLines: 2,),
                      SizedBox(height: 12,),
                      Text("Rp 1.800.000", style: TextStyle(color: CustomColor.orange, fontSize: 14, fontWeight: FontWeight.w600)),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset("assets/icon/icon_gedung.png"),
                            ),
                            Text("Lenmarc Jakarta", style: TextStyle(color: CustomColor.greyColor, fontSize: 14, fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset("assets/icon/icon_location.png"),
                            ),
                            Text("Menteng, Jakarta", style: TextStyle(color: CustomColor.primaryColor, fontSize: 12, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                      child: Expanded(child: Image.asset("assets/images/hospital2_image.png"))),
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}
