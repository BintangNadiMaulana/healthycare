import 'package:flutter/material.dart';

import '../Utils/Widgets/reusable_widget.dart';
import '../Utils/custom_color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // P5: semua controller dibuat private (tambah _ di depan)
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _noKTPController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noTelponController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _noKTPController.dispose();
    _emailController.dispose();
    _noTelponController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final noTelpon = _noTelponController.text.trim();
    final noKTP = _noKTPController.text.trim();

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
          const Padding(
            padding: EdgeInsets.only(top: 30),
            // P5: ReusableWidget (bukan ResUseAbleWidget)
            child: Text("Nama Depan",
                style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          ReusableWidget().customForm(_firstNameController, "Jhon"),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("Nama Belakang",
                style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          ReusableWidget().customForm(_lastNameController, "Doe"),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("Email",
                style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          ReusableWidget().customForm(_emailController, "Masukan Email Anda"),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("No. Telpon",
                style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          ReusableWidget().customForm(_noTelponController, "Masukan No. Telpon Anda"),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("No. KTP",
                style: TextStyle(
                    color: CustomColor.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          ReusableWidget().customForm(_noKTPController, "Masukan No. KTP Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 43, bottom: 43),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("assets/icon/icon_warning.png"),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya",
                        maxLines: 2,
                        // P5: const TextStyle
                        style: TextStyle(
                            color: CustomColor.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // P5: ReusableWidget (bukan ResUseAbleWidget)
          ReusableWidget().btnPrimaryCustomIcon(
              "Simpan Profile", _saveProfile, "assets/icon/icon_disket.png"),
        ],
      ),
    );
  }
}
