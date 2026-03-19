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
  // P5: private controller (tambah _ di depan)
  final TextEditingController _searchController = TextEditingController();

  int _selectedCategoryIndex = 0;
  final List<String> _categories = ["All Product", "Layanan Kesehatan", "Alat Kesehatan"];
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: CustomColor.primaryColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => _showSnackBar("Menu navigasi akan segera hadir"),
          child: Image.asset("assets/icon/icon_navigator.png"),
        ),
        actions: [
          GestureDetector(
            onTap: () => _showSnackBar("Keranjang belanja akan segera hadir"),
            child: Image.asset("assets/icon/icon_trolly.png"),
          ),
          GestureDetector(
            onTap: () => _showSnackBar("Notifikasi akan segera hadir"),
            child: Image.asset("assets/icon/icon_bell.png"),
          ),
        ],
      ),
      body: _homeBody(context),
    );
  }

  Widget _homeBody(BuildContext context) {
    return ListView(
      children: [
        const HomeContainer(),
        const SpecialServiceContainer(),
        const InspectionTrackContainer(),

        // search section
        Row(
          children: [
            GestureDetector(
              onTap: () => _showSnackBar("Filter produk akan segera hadir"),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 30, top: 20),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                // P5: ReusableWidget (bukan ResUseAbleWidget)
                child: Image.asset("assets/icon/icon_filter.png"),
              ),
            ),
            Container(
              width: 265,
              child: ReusableWidget().customForm(_searchController, "Search"),
            ),
          ],
        ),

        if (_searchQuery.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Text(
              "Hasil pencarian: \"$_searchQuery\"",
              style: const TextStyle(
                  color: CustomColor.secondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),

        // tab kategori interaktif
        Container(
          margin: const EdgeInsets.only(top: 47),
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final bool isSelected = _selectedCategoryIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 7, bottom: 7),
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isSelected
                        ? CustomColor.primaryColor
                        : Colors.white,
                  ),
                  height: 30,
                  child: Center(
                    child: Text(
                      _categories[index],
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : CustomColor.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // list produk
        Container(
          margin: const EdgeInsets.only(top: 26),
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildProductCard("Suntik Steril", "Rp 10.000", "Ready Stock"),
              const SizedBox(width: 15),
              _buildProductCard("Suntik Steril", "Rp 10.000", "Ready Stock"),
              const SizedBox(width: 15),
              _buildProductCard("Suntik Steril", "Rp 10.000", "Ready Stock"),
            ],
          ),
        ),

        // text pilih tipe layanan
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 30, left: 20),
          child: ReusableWidget().primaryColorText("Pilih Tipe Layanan Kesehatan Anda"),
        ),

        _buildLayananCard(
          title: "PCR Swab Test (Drive Thru)\nHasil 1 Hari Kerja",
          price: "Rp 1.400.000",
          location: "Lenmarc Surabaya",
          address: "Dukuh Pakis, Surabaya",
          image: "assets/images/hospital1_image.png",
        ),

        _buildLayananCard(
          title: "PCR Swab Test (Drive Thru)\nHasil 1 Hari Kerja",
          price: "Rp 1.800.000",
          location: "Lenmarc Jakarta",
          address: "Menteng, Jakarta",
          image: "assets/images/hospital2_image.png",
        ),
      ],
    );
  }

  Widget _buildProductCard(String name, String price, String status) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
                child: Image.asset("assets/images/mikroskop_image.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 10),
                  child: Text(name,
                      style: const TextStyle(
                          color: CustomColor.secondaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Text(price,
                            style: const TextStyle(
                                color: CustomColor.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.only(
                            top: 3, left: 5, bottom: 3, right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: CustomColor.greenBackground),
                        child: Center(
                          child: Text(status,
                              style: const TextStyle(
                                  color: CustomColor.green,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
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

  Widget _buildLayananCard({
    required String title,
    required String price,
    required String location,
    required String address,
    required String image,
  }) {
    return GestureDetector(
      onTap: () => _showSnackBar("Detail layanan akan segera hadir"),
      child: Container(
        margin: const EdgeInsets.only(top: 40, bottom: 30, left: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: CustomColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      maxLines: 2),
                  const SizedBox(height: 12),
                  Text(price,
                      style: const TextStyle(
                          color: CustomColor.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset("assets/icon/icon_gedung.png"),
                        ),
                        Text(location,
                            style: const TextStyle(
                                color: CustomColor.greyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
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
                        Text(address,
                            style: const TextStyle(
                                color: CustomColor.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
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
                child: Image.asset(image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
