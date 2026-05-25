class LayananModel {
  final String title;
  final String price;
  final String location;
  final String address;
  final String image;

  const LayananModel({
    required this.title,
    required this.price,
    required this.location,
    required this.address,
    required this.image,
  });
}

final List<LayananModel> dummyLayanan = [
  const LayananModel(
    title: 'PCR Swab Test (Drive Thru)\nHasil 1 Hari Kerja',
    price: 'Rp 1.400.000',
    location: 'Lenmarc Surabaya',
    address: 'Dukuh Pakis, Surabaya',
    image: 'assets/images/hospital1_image.png',
  ),
  const LayananModel(
    title: 'PCR Swab Test (Drive Thru)\nHasil 1 Hari Kerja',
    price: 'Rp 1.800.000',
    location: 'Lenmarc Jakarta',
    address: 'Menteng, Jakarta',
    image: 'assets/images/hospital2_image.png',
  ),
];
