import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mc_dragon/common_widget/BuilderAppBar.dart';
import 'package:mc_dragon/common_widget/RoundTextField.dart';
import 'package:mc_dragon/view/edit_profile/compoents/add_Image.dart';

import '../../common_widget/round_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formfield = GlobalKey<FormState>();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  FocusNode fieldusername = FocusNode();
  FocusNode fieldphone = FocusNode();
  FocusNode fieldemail = FocusNode();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: BuilderAppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
        title: "",
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: AddImage(),
            ),
            Form(
              key: _formfield,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundTextField(
                      controller: txtUsername,
                      title: "Name",
                      focusNode: fieldusername,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldphone);
                      },
                      subtitle: "nanaq",
                      keyboardType: TextInputType.text,
                      icon: "assets/image/user-avatar.png"),
                  const SizedBox(height: 25),
                  RoundTextField(
                      controller: txtPhone,
                      title: "Phone Number",
                      focusNode: fieldphone,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldemail);
                      },
                      subtitle: "+855 88123456",
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.phone,
                      icon: "assets/image/telephone.png"),
                  const SizedBox(height: 25),
                  RoundTextField(
                      controller: txtEmail,
                      title: "Email",
                      focusNode: fieldemail,
                      subtitle: "string",
                      keyboardType: TextInputType.emailAddress,
                      icon: "assets/image/email.png"),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(title: "Save", onPress: () {}),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
