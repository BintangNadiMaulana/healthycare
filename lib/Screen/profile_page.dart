import 'package:flutter/material.dart';

import '../Utils/Widgets/reusable_widget.dart';
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
      body:profileBody(context),
    );
  }

  Widget profileBody(BuildContext context){
    return Container(
      margin: EdgeInsets.only(left: 32, right: 32),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("Pastikan profile anda terisi dengan benar"),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
