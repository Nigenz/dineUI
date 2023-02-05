import 'package:flutter/material.dart';
import '../constants.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.isPassWordVisible,
    required this.onTap,
    required this.labelText,
    required this.parameterText,
  }) : super(key: key);

  final bool isPassWordVisible;
  final VoidCallback onTap;
  final String labelText;
  final TextEditingController parameterText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: kBodyText.copyWith(color: Colors.white),
        obscureText: isPassWordVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        controller: parameterText,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Colors.grey,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: onTap,
                  icon: Icon(
                    isPassWordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  )),
            ),
            contentPadding: EdgeInsets.all(20),
            labelText: labelText,
            labelStyle: kBodyText,
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
