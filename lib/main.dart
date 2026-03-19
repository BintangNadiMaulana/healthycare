import 'package:flutter/material.dart';
// P6: update import dari latihan_ui ke healthycare
import 'package:healthycare/Screen/login_page.dart';
import 'package:healthycare/Screen/home_page.dart';
import 'package:healthycare/Screen/register_page.dart';
import 'package:healthycare/Screen/profile_page.dart';
import 'package:healthycare/Utils/custom_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // P6: title diubah dari 'Latihan UI' ke nama app sebenarnya
      title: 'Healthy Care',
      debugShowCheckedModeBanner: false,
      // P6: theme disesuaikan dengan CustomColor.primaryColor (navy #1D334F)
      // bukan Colors.blue yang tidak konsisten
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomColor.primaryColor,
          primary: CustomColor.primaryColor,
        ),
        useMaterial3: false,
      ),
      // P6: named routes untuk navigasi yang lebih terstruktur
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
