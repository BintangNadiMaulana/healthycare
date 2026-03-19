// P6: model untuk data produk — pisahkan data dari UI
class ProductModel {
  final String name;
  final String price;
  final String status;
  final String image;

  const ProductModel({
    required this.name,
    required this.price,
    required this.status,
    required this.image,
  });
}

// P6: data produk tidak lagi hardcoded di dalam widget
final List<ProductModel> dummyProducts = [
  const ProductModel(
    name: 'Suntik Steril',
    price: 'Rp 10.000',
    status: 'Ready Stock',
    image: 'assets/images/mikroskop_image.png',
  ),
  const ProductModel(
    name: 'Suntik Steril',
    price: 'Rp 10.000',
    status: 'Ready Stock',
    image: 'assets/images/mikroskop_image.png',
  ),
  const ProductModel(
    name: 'Suntik Steril',
    price: 'Rp 10.000',
    status: 'Ready Stock',
    image: 'assets/images/mikroskop_image.png',
  ),
];
