import 'package:flutter/material.dart';

class ButtonProfile extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const ButtonProfile({super.key, required this.title, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.maxFinite,
      height: 43,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.grey.shade300,
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 14.5,
            color: Colors.blueAccent.shade700,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
