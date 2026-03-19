import 'package:flutter/material.dart';
// P6: update semua import dari latihan_ui ke healthycare
import 'package:healthycare/Utils/Widgets/reusable_widget.dart';
import 'package:healthycare/Utils/custom_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _doLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty) {
      _showSnackBar("Email tidak boleh kosong");
      return;
    }
    if (!email.contains('@') || !email.contains('.')) {
      _showSnackBar("Format email tidak valid");
      return;
    }
    if (password.isEmpty) {
      _showSnackBar("Password tidak boleh kosong");
      return;
    }
    if (password.length < 6) {
      _showSnackBar("Password minimal 6 karakter");
      return;
    }

    // P6: gunakan named route '/home' bukan Navigator.push langsung
    Navigator.pushNamed(context, '/home');
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
      body: _loginBody(context),
    );
  }

  Widget _loginBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 110, bottom: 4),
            child: Row(
              children: [
                Text("Hai, ",
                    style: TextStyle(
                        color: CustomColor.primaryColor, fontSize: 28)),
                Text("Selamat Datang",
                    style: TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Text(
            "Silahkan login untuk melanjutkan",
            style: TextStyle(
                color: CustomColor.secondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Image.asset("assets/images/login_image.png"),
          ReusableWidget().primaryColorText("Email"),
          ReusableWidget().customForm(_emailController, "Masukan Email Anda"),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableWidget().primaryColorText("Password"),
                GestureDetector(
                  onTap: () => _showSnackBar("Fitur lupa password akan segera hadir"),
                  child: const Text(
                    "Lupa password anda ?",
                    style: TextStyle(
                        color: CustomColor.greyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          ReusableWidget().customFormPassword(
              _passwordController, "Masukan Password Anda", () {
            setState(() {
              _showPassword = !_showPassword;
            });
          }, _showPassword),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 30),
            child: ReusableWidget().btnMain("Login", _doLogin),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Belum punya akun? ",
                  style: TextStyle(
                      color: CustomColor.greyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                    onTap: () {
                      // P6: gunakan named route '/register'
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      "Daftar sekarang",
                      style: TextStyle(
                          color: CustomColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
