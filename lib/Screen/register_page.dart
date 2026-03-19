import 'package:flutter/material.dart';
import 'package:latihan_ui/Utils/Widgets/reusable_widget.dart';

import '../Utils/custom_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController noKTPController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noTelponController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController konfirmasiPasswordController = TextEditingController();

  bool _showPassword = true;
  bool _showConfirmPassword = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    noKTPController.dispose();
    emailController.dispose();
    noTelponController.dispose();
    passwordController.dispose();
    konfirmasiPasswordController.dispose();
    super.dispose();
  }

  // P3: validasi semua field sebelum registrasi
  void _doRegister() {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final noKTP = noKTPController.text.trim();
    final email = emailController.text.trim();
    final noTelpon = noTelponController.text.trim();
    final password = passwordController.text;
    final konfirmasi = konfirmasiPasswordController.text;

    if (firstName.isEmpty) {
      _showSnackBar("Nama depan tidak boleh kosong");
      return;
    }
    if (lastName.isEmpty) {
      _showSnackBar("Nama belakang tidak boleh kosong");
      return;
    }
    if (noKTP.isEmpty) {
      _showSnackBar("No. KTP tidak boleh kosong");
      return;
    }
    if (noKTP.length != 16) {
      _showSnackBar("No. KTP harus 16 digit");
      return;
    }
    if (email.isEmpty) {
      _showSnackBar("Email tidak boleh kosong");
      return;
    }
    if (!email.contains('@') || !email.contains('.')) {
      _showSnackBar("Format email tidak valid");
      return;
    }
    if (noTelpon.isEmpty) {
      _showSnackBar("No. Telpon tidak boleh kosong");
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
    if (konfirmasi.isEmpty) {
      _showSnackBar("Konfirmasi password tidak boleh kosong");
      return;
    }
    if (password != konfirmasi) {
      _showSnackBar("Password dan konfirmasi password tidak sama");
      return;
    }

    _showSnackBar("Registrasi berhasil! Silahkan login.");
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
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
      body: _registerBody(context),
    );
  }

  Widget _registerBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110, bottom: 4),
            child: Row(
              children: [
                Text("Hai, ", style: TextStyle(color: CustomColor.primaryColor, fontSize: 28)),
                Text("Selamat Datang", style: TextStyle(color: CustomColor.primaryColor, fontSize: 28, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text("Silahkan daftar untuk melanjutkan",
              style: TextStyle(color: CustomColor.secondaryColor, fontSize: 12, fontWeight: FontWeight.w600)),
          Image.asset("assets/images/login_image.png"),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ResUseAbleWidget().primaryColorText("Nama Depan"),
                      ResUseAbleWidget().customForm(firstNameController, "Jhon"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ResUseAbleWidget().primaryColorText("Nama Belakang"),
                      ResUseAbleWidget().customForm(lastNameController, "Doe"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ResUseAbleWidget().primaryColorText("No. KTP"),
          ResUseAbleWidget().customForm(noKTPController, "Masukan No. KTP Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ResUseAbleWidget().primaryColorText("Email"),
          ),
          // P1 fix: emailController (bukan noKTPController)
          ResUseAbleWidget().customForm(emailController, "Masukan Email Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ResUseAbleWidget().primaryColorText("No. Telpon"),
          ),
          ResUseAbleWidget().customForm(noTelponController, "Masukan No. Telpon Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ResUseAbleWidget().primaryColorText("Password"),
          ),
          ResUseAbleWidget().customFormPassword(passwordController, "Masukan Password Anda", () {
            setState(() { _showPassword = !_showPassword; });
          }, _showPassword),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ResUseAbleWidget().primaryColorText("Konfirmasi Password"),
          ),
          ResUseAbleWidget().customFormPassword(konfirmasiPasswordController, "Konfirmasi Password Anda", () {
            setState(() { _showConfirmPassword = !_showConfirmPassword; });
          }, _showConfirmPassword),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 30),
            // P3: panggil _doRegister() dengan validasi lengkap
            child: ResUseAbleWidget().btnMain("Registrasi", _doRegister),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun? ",
                    style: TextStyle(color: CustomColor.greyColor, fontSize: 14, fontWeight: FontWeight.w400)),
                GestureDetector(
                    onTap: () { Navigator.pop(context); },
                    child: const Text("Login sekarang",
                        style: TextStyle(color: CustomColor.primaryColor, fontSize: 14, fontWeight: FontWeight.w600)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
