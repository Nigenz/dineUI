import 'package:dine/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/custom_widget.dart';
import 'screens.dart';
import '../responsive.dart';
import '../widgets/custom_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: (Responsive.isMobile(context))
                          ? MediaQuery.of(context).size.height * 0.3
                          : MediaQuery.of(context).size.height * 0.4,
                      child: Image(image: AssetImage("images/spoon.png")),
                    ),
                  ),
                  Text(
                    "Welcome To ",
                    style: kHeadline,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "I’ve added a number of debugPrint statements so you can check you",
                      style: kBodyText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context))
                  ? MediaQuery.of(context).size.width * 0.5
                  : MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(18)),
              child: Row(children: [
                Expanded(
                  child: MyTextButton(
                    bgColor: Colors.white,
                    buttonName: "Sign Up",
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: ((context) => const Registration())));
                    },
                    textColor: Colors.black87,
                  ),
                ),
                Expanded(
                  child: MyTextButton(
                    bgColor: Colors.transparent,
                    buttonName: "Login",
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: ((context) => const LoginPage())));
                    },
                    textColor: Colors.white,
                  ),
                ),
              ]),
            ),
          ],
        ),
      )),
    );
  }
}
