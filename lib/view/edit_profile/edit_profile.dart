import 'package:flutter/material.dart';
import 'package:mc_dragon/common_widget/BuilderAppBar.dart';
import 'package:mc_dragon/view/edit_profile/compoents/add_Image.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  void imagePickerOption() {}

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
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
      body: const SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: AddImage(),
            ),
          ],
        ),
      ),
    );
  }
}
