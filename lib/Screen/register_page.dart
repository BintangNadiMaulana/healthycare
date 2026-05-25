import 'package:flutter/material.dart';
import 'package:healthycare/Utils/Widgets/reusable_widget.dart';
import 'package:healthycare/Utils/custom_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _noKTPController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noTelponController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _konfirmasiPasswordController = TextEditingController();

  bool _showPassword = true;
  bool _showConfirmPassword = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _noKTPController.dispose();
    _emailController.dispose();
    _noTelponController.dispose();
    _passwordController.dispose();
    _konfirmasiPasswordController.dispose();
    super.dispose();
  }

  void _doRegister() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final noKTP = _noKTPController.text.trim();
    final email = _emailController.text.trim();
    final noTelpon = _noTelponController.text.trim();
    final password = _passwordController.text;
    final konfirmasi = _konfirmasiPasswordController.text;

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
      if (mounted) Navigator.pop(context);
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
      body: _registerBody(),
    );
  }

  Widget _registerBody() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 110, bottom: 4),
            child: Row(
              children: [
                Text(
                  "Hai, ",
                  style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 28,
                  ),
                ),
                Text(
                  "Selamat Datang",
                  style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Silahkan daftar untuk melanjutkan",
            style: TextStyle(
              color: CustomColor.secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
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
                      ReusableWidget().primaryColorText("Nama Depan"),
                      ReusableWidget().customForm(_firstNameController, "Jhon"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableWidget().primaryColorText("Nama Belakang"),
                      ReusableWidget().customForm(_lastNameController, "Doe"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ReusableWidget().primaryColorText("No. KTP"),
          ReusableWidget().customForm(_noKTPController, "Masukan No. KTP Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ReusableWidget().primaryColorText("Email"),
          ),
          ReusableWidget().customForm(_emailController, "Masukan Email Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ReusableWidget().primaryColorText("No. Telpon"),
          ),
          ReusableWidget().customForm(_noTelponController, "Masukan No. Telpon Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ReusableWidget().primaryColorText("Password"),
          ),
          ReusableWidget().customFormPassword(
            _passwordController,
            "Masukan Password Anda",
            () => setState(() => _showPassword = !_showPassword),
            _showPassword,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ReusableWidget().primaryColorText("Konfirmasi Password"),
          ),
          ReusableWidget().customFormPassword(
            _konfirmasiPasswordController,
            "Konfirmasi Password Anda",
            () => setState(() => _showConfirmPassword = !_showConfirmPassword),
            _showConfirmPassword,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 30),
            child: ReusableWidget().btnMain("Registrasi", _doRegister),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sudah punya akun? ",
                  style: TextStyle(
                    color: CustomColor.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    "Login sekarang",
                    style: TextStyle(
                      color: CustomColor.primaryColor,
                      fontSize: 14,
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
}
