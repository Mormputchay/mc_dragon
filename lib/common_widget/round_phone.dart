import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundPhone extends StatelessWidget {
  RoundPhone({super.key});
  TextEditingController txtPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const CountryCodePicker(
              onChanged: print,
              initialSelection: 'IT',
              favorite: ['+39', 'FR'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              alignLeft: false,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextFormField(
            controller: txtPhone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.phone,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 1)),
                hintText: "Phone Number",
                hintStyle: const TextStyle(fontSize: 16, color: Colors.black)),
          )),
        ],
      ),
    );
  }
}
