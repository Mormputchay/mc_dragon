import 'package:flutter/material.dart';

class TextProduct extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const TextProduct({super.key, required this.title, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Product",
          style: TextStyle(
              fontSize: 22,
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            "See more",
            style: TextStyle(
                fontSize: 22,
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
