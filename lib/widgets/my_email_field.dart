import 'package:dine/utils/validator.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required this.inputType,
    required this.labelText,
    required this.parameterText,
  }) : super(key: key);

  final String labelText;
  final TextInputType inputType;
  final TextEditingController parameterText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: kBodyText.copyWith(color: Colors.white),
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        controller: parameterText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20),
            labelText: labelText,
            labelStyle: kBodyText,
            prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(18)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(18))),
      ),
    );
  }
}
