import 'package:dine/constants.dart';
import 'package:dine/screens/data_processing/upload_page.dart';
import 'package:dine/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../responsive.dart';
import '../widgets/custom_widget.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
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
                          children: const [
                            MyTextField(
                              hintText: "Enter hotel/restaurant name",
                              inputType: TextInputType.text,
                            ),
                            MyTextField(
                              hintText: "Enter owner's Name",
                              inputType: TextInputType.text,
                            ),
                            MyTextField(
                              hintText: "Enter hotel/restaurant address",
                              inputType: TextInputType.streetAddress,
                            ),
                            MyTextField(
                              hintText: "Enter valid registration no. ",
                              inputType: TextInputType.text,
                            ),
                            MyTextField(
                              hintText: "Enter contact no. ",
                              inputType: TextInputType.phone,
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
