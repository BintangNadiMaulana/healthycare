import 'package:flutter/material.dart';

import '../Utils/Widgets/reusable_widget.dart';
import '../Utils/custom_color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController noKTPController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noTelponController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    noKTPController.dispose();
    emailController.dispose();
    noTelponController.dispose();
    super.dispose();
  }

  // P3: validasi dan feedback saat simpan profile
  void _saveProfile() {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final email = emailController.text.trim();
    final noTelpon = noTelponController.text.trim();
    final noKTP = noKTPController.text.trim();

    if (firstName.isEmpty) {
      _showSnackBar("Nama depan tidak boleh kosong");
      return;
    }
    if (lastName.isEmpty) {
      _showSnackBar("Nama belakang tidak boleh kosong");
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
    if (noKTP.isEmpty) {
      _showSnackBar("No. KTP tidak boleh kosong");
      return;
    }

    // P3: feedback sukses ke user (bukan hanya print ke konsol)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile berhasil disimpan!"),
        backgroundColor: CustomColor.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
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
        leading: Image.asset("assets/icon/icon_navigator.png"),
        actions: [
          Image.asset("assets/icon/icon_trolly.png"),
          Image.asset("assets/icon/icon_bell.png"),
        ],
      ),
      body: _profileBody(context),
    );
  }

  Widget _profileBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
      margin: const EdgeInsets.only(left: 32, right: 32),
      color: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ResUseAbleWidget().primaryColorText("Nama Depan"),
          ),
          ResUseAbleWidget().customForm(firstNameController, "Jhon"),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ResUseAbleWidget().primaryColorText("Nama Belakang"),
          ),
          ResUseAbleWidget().customForm(lastNameController, "Doe"),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ResUseAbleWidget().primaryColorText("Email"),
          ),
          ResUseAbleWidget().customForm(emailController, "Masukan Email Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ResUseAbleWidget().primaryColorText("No. Telpon"),
          ),
          ResUseAbleWidget().customForm(noTelponController, "Masukan No. Telpon Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ResUseAbleWidget().primaryColorText("No. KTP"),
          ),
          ResUseAbleWidget().customForm(noKTPController, "Masukan No. KTP Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 43, bottom: 43),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("assets/icon/icon_warning.png"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        "Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya",
                        maxLines: 2,
                        style: const TextStyle(
                            color: CustomColor.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // P3: simpan profile dengan validasi + SnackBar feedback
          ResUseAbleWidget().btnPrimaryCustomIcon(
              "Simpan Profile", _saveProfile, "assets/icon/icon_disket.png"),
        ],
      ),
    );
  }
}
