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
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerBody(context),
    );
  }

  Widget _registerBody(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: ListView(
        children: [
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
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                    children: [
                      ResUseAbleWidget().primaryColorText("Nama Depan"),
                      ResUseAbleWidget().customForm(firstNameController, "Jhon")
                    ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                  ),),
                  Expanded(child: Column(
                    children: [
                      ResUseAbleWidget().primaryColorText("Nama Belakang"),
                      ResUseAbleWidget().customForm(lastNameController, "Doe")
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),)
                ],
              ),
            ),
            ResUseAbleWidget().primaryColorText("No. KTP"),
            ResUseAbleWidget().customForm(noKTPController, "Masukan No. KTP Anda"),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ResUseAbleWidget().primaryColorText("Email"),
            ),
            ResUseAbleWidget().customForm(noKTPController, "Masukan Email Anda"),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ResUseAbleWidget().primaryColorText("No. Telpon"),
            ),
            ResUseAbleWidget().customForm(noTelponController, "Masukan No. Telpon Anda"),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ResUseAbleWidget().primaryColorText("Password"),
            ),
            ResUseAbleWidget().customFormPassword(passwordController, "Masukan Password Anda", (){
              setState(() {
                _showPassword = !_showPassword;
              });
            }, _showPassword),
            Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ResUseAbleWidget().primaryColorText("Konfirmasi Password"),
          ),
            ResUseAbleWidget().customFormPassword(konfirmasiPasswordController, "Konfirmasi Password Anda", (){
              setState(() {
                _showConfirmPassword = !_showConfirmPassword;
              });
            }, _showConfirmPassword),
            Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 30),
            child: ResUseAbleWidget().btnMain("Registrasi", () { }),
          ),
            Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun? ", style: TextStyle(color: CustomColor.greyColor, fontSize: 14, fontWeight: FontWeight.w400),),
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Login sekarang", style: TextStyle(color: CustomColor.primaryColor, fontSize: 14,fontWeight: FontWeight.w600),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
