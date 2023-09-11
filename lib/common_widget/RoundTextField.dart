import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String subtitle;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String icon;
  const RoundTextField(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      this.keyboardType,
      this.inputFormatters,
      required this.controller,
      this.focusNode,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            title,
            style: const TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 25,
                height: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    onFieldSubmitted: onFieldSubmitted,
                    inputFormatters: inputFormatters,
                    keyboardType: keyboardType,
                    decoration: InputDecoration(
                      hintText: subtitle,
                      hintStyle:
                          const TextStyle(fontSize: 15, color: Colors.black),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
