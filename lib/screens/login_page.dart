import 'package:dine/screens/register.dart';
import 'package:dine/screens/user_details_page.dart';
import 'package:dine/widgets/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../api_requests/register_auth.dart';
import '../constants.dart';
import '../responsive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();
  final TextEditingController parameterTextEmail = TextEditingController();
  final TextEditingController parameterTextPassword = TextEditingController();

  Future<void> loginUsers() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      Map<String, dynamic> userData = {
        "Email": parameterTextEmail.text,
        "Password": parameterTextPassword.text,
      };

      dynamic result = await _apiClient.registerUser(userData);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (result['ErrorCode'] == null) {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserDetail()));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${result['Message']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  bool isPassWordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
          textAlign: TextAlign.center,
          style: appBarTitle,
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'images/backarrow.svg',
            width: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: CustomScrollView(
        reverse: true,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: (Responsive.isMobile(context))
                          ? MediaQuery.of(context).size.height * 0.3
                          : MediaQuery.of(context).size.height * 0.4,
                      child: Image(image: AssetImage("images/dine1.png")),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      width: (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                          ? MediaQuery.of(context).size.width * 0.5
                          : ((Responsive.isTablet(context))
                              ? MediaQuery.of(context).size.width * 0.8
                              : MediaQuery.of(context).size.width),
                      // height: (Responsive.isDesktop(context))
                      //     ? MediaQuery.of(context).size.height * 0.05
                      //     : ((Responsive.isTablet(context))
                      //         ? MediaQuery.of(context).size.height * 0.05
                      //         : MediaQuery.of(context).size.height),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            EmailField(
                              labelText: "Enter Email Address ",
                              inputType: TextInputType.emailAddress,
                              parameterText: parameterTextEmail,
                            ),
                            PasswordField(
                              labelText: "Enter Password",
                              isPassWordVisible: isPassWordVisible,
                              onTap: () {
                                setState(() {
                                  isPassWordVisible = !isPassWordVisible;
                                });
                              },
                              parameterText: parameterTextPassword,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot Password? ",
                                style: kBodyText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Responsive.issmallScreen(context)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: kBodyText,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          const Registration())),
                                );
                              },
                              child: Text(
                                "Register",
                                style: kBodyText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: kBodyText,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          const Registration())),
                                );
                              },
                              child: Text(
                                "Register",
                                style: kBodyText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Container(
                    width: (Responsive.isDesktop(context) ||
                            Responsive.isTablet(context))
                        ? MediaQuery.of(context).size.width * 0.5
                        : MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: MyTextButton(
                          buttonName: "Login",
                          onTap: () {},
                          bgColor: Colors.white,
                          textColor: Colors.black87),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
