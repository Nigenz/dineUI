import 'package:dine/constants.dart';
import 'package:dine/screens/data_processing/upload_page.dart';
import 'package:dine/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../api_requests/register_auth.dart';
import '../responsive.dart';
import '../widgets/custom_widget.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();
  final TextEditingController parameterTextHotelName = TextEditingController();
  final TextEditingController parameterTextOwner = TextEditingController();
  final TextEditingController parameterTextAddress = TextEditingController();
  final TextEditingController parameterTextRegistration =
      TextEditingController();
  final TextEditingController parameterTextContactNo = TextEditingController();

  Future<void> userDetails() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      Map<String, dynamic> userData = {
        "HotelName": parameterTextHotelName.text,
        "OwnerName": parameterTextOwner.text,
        "HotelAddress": parameterTextAddress.text,
        "HotelRegister": parameterTextRegistration.text,
        "ContactNo": parameterTextContactNo.text,
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
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
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
                              labelText: "Enter Hotel/Restaurant Name",
                              inputType: TextInputType.text,
                              parameterText: parameterTextHotelName,
                            ),
                            MyTextField(
                              labelText: "Enter Owner's Name",
                              inputType: TextInputType.text,
                              parameterText: parameterTextOwner,
                            ),
                            MyTextField(
                              labelText: "Enter Hotel/Restaurant Address",
                              inputType: TextInputType.streetAddress,
                              parameterText: parameterTextAddress,
                            ),
                            MyTextField(
                              labelText: "Enter Valid Registration No. ",
                              inputType: TextInputType.text,
                              parameterText: parameterTextRegistration,
                            ),
                            MyTextField(
                              labelText: "Enter Contact No. ",
                              inputType: TextInputType.phone,
                              parameterText: parameterTextContactNo,
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
                            Checkbox(
                              side: BorderSide(color: Colors.white, width: 1.5),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              "I agree to the Terms of Use and Privacy Statement.",
                              style: kBodyText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              side: BorderSide(color: Colors.white, width: 1.5),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              "I agree to the Terms of Use and Privacy Statement.",
                              style: kBodyText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                  SizedBox(
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
                          buttonName: "Submit",
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: ((context) => const UploadFile())),
                            );
                          },
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
