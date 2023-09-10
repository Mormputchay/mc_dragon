import 'package:flutter/material.dart';

class TextFollowing extends StatelessWidget {
  final String title;
  final String subTitle;
  const TextFollowing({super.key, required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.blueAccent),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 15, color: Colors.blueAccent),
        )
      ],
    );
  }
}
