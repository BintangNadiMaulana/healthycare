import 'package:flutter/material.dart';
import 'package:latihan_ui/Utils/Widgets/reusable_widget.dart';
import 'package:latihan_ui/Utils/custom_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerBody(context),
    );
  }


  // ini register body
  Widget _registerBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: ListView(
        children: [
          // text hai, selamat datang
          Padding(
            padding: const EdgeInsets.only(top: 110, bottom: 4),
            child: Row(
              children: [
                Text("Hai, ", style: TextStyle(color: CustomColor.primaryColor, fontSize: 28),),
                Text("Selamat Datang", style: TextStyle(color: CustomColor.primaryColor, fontSize: 28, fontWeight: FontWeight.bold),),
              ],

            ),
          ),
          Text("Silahkan login untuk melanjutkan", style: TextStyle(color: CustomColor.secondaryColor, fontSize: 12, fontWeight: FontWeight.w600)),
          Image.asset("assets/images/login_image.png"),
          ResUseAbleWidget().primaryColorText("Email"),
          ResUseAbleWidget().customForm(_emailController, "Masukan Email Anda"),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResUseAbleWidget().primaryColorText("Password"),
                Text("Lupa password anda ?", style:  TextStyle(color: CustomColor.greyColor, fontSize: 14, fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          ResUseAbleWidget().customForm(_emailController, "Masukan Password Anda"),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 30),
            child: ResUseAbleWidget().customMainButton("Login", () { }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70, bottom: 41),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Belum punya akun ?", style: TextStyle(color: CustomColor.greyColor, fontSize: 14, fontWeight: FontWeight.w400),),
                Text("Daftar sekarang", style: TextStyle(color: CustomColor.primaryColor, fontSize: 14,fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
