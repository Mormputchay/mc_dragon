import 'package:flutter/material.dart';

class TabTextButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  final String title;
  final bool isActive;
  const TabTextButton(
      {super.key,
      required this.title,
      this.isActive = false,
      required this.onPressed,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  color: isActive ? Colors.blueAccent : Colors.grey,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                      color: isActive ? Colors.blueAccent : Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
