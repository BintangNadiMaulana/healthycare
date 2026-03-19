import 'package:flutter/material.dart';
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
      title: 'Healthy Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomColor.primaryColor,
          primary: CustomColor.primaryColor,
        ),
        useMaterial3: false,
      ),
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
