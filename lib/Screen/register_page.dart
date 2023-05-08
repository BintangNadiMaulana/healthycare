import 'package:flutter/material.dart';
import 'package:latihan_ui/Utils/Widgets/reusable_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerBody(context),
    );
  }

  // todo tugas mas bintang buat sesuai figma
  Widget _registerBody(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: ListView(
        children: [
            Row(
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
                    ResUseAbleWidget().customForm(firstNameController, "Doe")
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),)
              ],
            )
        ],
      ),
    );
  }
}
