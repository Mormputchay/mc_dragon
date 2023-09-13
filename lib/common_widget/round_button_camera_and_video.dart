import 'package:flutter/material.dart';

class RoundButtonCameraAndVideo extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  final bool isActive;
  const RoundButtonCameraAndVideo({
    super.key,
    required this.title,
    this.isActive = false,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 95,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isActive ? Colors.blueAccent.shade700 : Colors.white,
              borderRadius: BorderRadius.circular(19)),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: isActive ? Colors.white : Colors.grey.withOpacity(0.5),
            ),
          )),
    );
  }
}
