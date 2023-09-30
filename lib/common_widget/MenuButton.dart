import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String icons;
  final String title;
  final VoidCallback onPress;
  const MenuButton(
      {super.key,
      required this.icons,
      required this.title,
      required this.onPress});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icons,
              width: 50,
              height: 50,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 15, color: Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}
