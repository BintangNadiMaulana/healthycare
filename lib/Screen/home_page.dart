import 'package:flutter/material.dart';
import 'package:healthycare/Screen/widget/home_container.dart';
import 'package:healthycare/Screen/widget/inspection_track_container.dart';
import 'package:healthycare/Screen/widget/special_service_container.dart';
import 'package:healthycare/Utils/custom_color.dart';
import 'package:healthycare/Utils/Widgets/reusable_widget.dart';
import 'package:healthycare/Model/product_model.dart';
import 'package:healthycare/Model/layanan_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  int    _selectedCategoryIndex = 0;
  String _searchQuery           = "";

  final List<String> _categories = [
    "All Product",
    "Layanan Kesehatan",
    "Alat Kesehatan",
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text.trim());
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

        // search bar
        Row(
          children: [
            GestureDetector(
              onTap: () => _showSnackBar("Filter produk akan segera hadir"),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 30, top: 20),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset("assets/icon/icon_filter.png"),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: ReusableWidget().customForm(_searchController, "Search"),
              ),
            ),
          ],
        ),

        if (_searchQuery.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Text(
              'Hasil pencarian: "$_searchQuery"',
              style: const TextStyle(
                color: CustomColor.secondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        // tab kategori
        Container(
          margin: const EdgeInsets.only(top: 47),
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final bool isSelected = _selectedCategoryIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedCategoryIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 7,
                  ),
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isSelected
                        ? CustomColor.primaryColor
                        : Colors.white,
                  ),
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
              );
            },
          ),
        ),

        // daftar produk
        Container(
          margin: const EdgeInsets.only(top: 26),
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dummyProducts.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) =>
                _buildProductCard(dummyProducts[index]),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 30, left: 20),
          child: ReusableWidget()
              .primaryColorText("Pilih Tipe Layanan Kesehatan Anda"),
        ),

        // daftar layanan
        ...dummyLayanan.map((layanan) => _buildLayananCard(layanan)),
      ],
    );
  }

  Widget _buildProductCard(ProductModel product) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(child: Image.asset(product.image)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 10),
            child: Text(
              product.name,
              style: const TextStyle(
                color: CustomColor.secondaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 22, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10),
                  child: Text(
                    product.price,
                    style: const TextStyle(
                      color: CustomColor.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: CustomColor.greenBackground,
                  ),
                  child: Text(
                    product.status,
                    style: const TextStyle(
                      color: CustomColor.green,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayananCard(LayananModel layanan) {
    return GestureDetector(
      onTap: () => _showSnackBar("Detail layanan akan segera hadir"),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    layanan.title,
                    style: const TextStyle(
                      color: CustomColor.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    layanan.price,
                    style: const TextStyle(
                      color: CustomColor.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset("assets/icon/icon_gedung.png"),
                        ),
                        Text(
                          layanan.location,
                          style: const TextStyle(
                            color: CustomColor.greyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                        Text(
                          layanan.address,
                          style: const TextStyle(
                            color: CustomColor.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                child: Image.asset(layanan.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
