import 'package:dine/constants.dart';
import 'package:dine/screens/screens.dart';
import 'package:dine/screens/user_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dine/api_requests/register_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../responsive.dart';
import '../utils/validator.dart';
import '../widgets/custom_widget.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();
  final TextEditingController parameterTextFirstName = TextEditingController();
  final TextEditingController parameterTextLastName = TextEditingController();
  final TextEditingController parameterTextEmail = TextEditingController();
  final TextEditingController parameterTextPassword = TextEditingController();
  final TextEditingController parameterTextConfirmPassword =
      TextEditingController();

  Future<void> registerUsers() async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Processing Data'),
      backgroundColor: Colors.green.shade300,
    ));

    Map<String, dynamic> userData = {
      "firstName": parameterTextFirstName.text,
      "lastName": parameterTextLastName.text,
      "email": parameterTextEmail.text,
      "password": parameterTextPassword.text,
      "confirmPassword": parameterTextConfirmPassword.text,
    };
    print(userData);
    dynamic result = await _apiClient.registerUser(userData);
    print(result);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (result == "success") {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const UserDetail()));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Error Registering User'),
        backgroundColor: Colors.red.shade300,
      ));
    }
  }

  bool isPassWordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign Up",
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
                            MyTextField(
                              labelText: "Enter First Name",
                              inputType: TextInputType.text,
                              parameterText: parameterTextFirstName,
                            ),
                            MyTextField(
                              labelText: "Enter Last Name",
                              inputType: TextInputType.text,
                              parameterText: parameterTextLastName,
                            ),
                            EmailField(
                              labelText: "Enter Email Address",
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
                            PasswordField(
                              labelText: "Confirm Password",
                              isPassWordVisible: isPassWordVisible,
                              onTap: () {
                                setState(() {
                                  isPassWordVisible = !isPassWordVisible;
                                });
                              },
                              parameterText: parameterTextConfirmPassword,
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
                            const Text(
                              "Already have an account? ",
                              style: kBodyText,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          const LoginPage())),
                                );
                              },
                              child: Text(
                                "Sign In",
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
                            const Text(
                              "Already have an account? ",
                              style: kBodyText,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) =>
                                          const LoginPage())),
                                );
                              },
                              child: Text(
                                "Sign In",
                                style: kBodyText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: (Responsive.isDesktop(context) ||
                            Responsive.isTablet(context))
                        ? MediaQuery.of(context).size.width * 0.5
                        : MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: MyTextButton(
                          buttonName: "Register",
                          onTap: registerUsers,
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //         builder: ((context) => const UserDetail())),
                          //   );
                          // },
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
