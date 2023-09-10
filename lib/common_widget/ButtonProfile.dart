import 'package:flutter/material.dart';

class ButtonProfile extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const ButtonProfile({super.key, required this.title, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 150,
      height: 43,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.white60.withOpacity(0.5),
      onPressed: onPress,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 14.5,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
