import 'package:flutter/material.dart';
import '../constants.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.isPassWordVisible,
    required this.onTap,
    required this.hintText,
  }) : super(key: key);

  final bool isPassWordVisible;
  final VoidCallback onTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: kBodyText.copyWith(color: Colors.white),
        obscureText: isPassWordVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
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
            hintText: hintText,
            hintStyle: kBodyText,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(18)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(18))),
      ),
    );
  }
}
