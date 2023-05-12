import 'package:flutter/material.dart';
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
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 30, left: 20),
            child: ResUseAbleWidget().primaryColorText("Pilih Tipe Layanan Kesehatan Anda"),
          )
        ],
      ),
    );
  }
}
