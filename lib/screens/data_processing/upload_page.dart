import 'dart:html';
import 'dart:math';

import 'package:dine/responsive.dart';
import 'package:dine/widgets/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../../constants.dart';
import '../screens.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  DropzoneViewController? controller;
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
                  Text(
                    "ADD MENU",
                    style: kHeadline,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      DropzoneView(
                        onDrop: acceptFile,
                        onCreated: (controller) => this.controller = controller,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            final events = await controller?.pickFiles();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: (Responsive.isMobile(context))
                                ? MediaQuery.of(context).size.height * 0.3
                                : MediaQuery.of(context).size.height * 0.4,
                            child:
                                Image(image: AssetImage("images/upload.png")),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "Image of all format and pdf supported. \n Please upload clear image or pdf.",
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
              child: MyTextButton(
                bgColor: Colors.white,
                buttonName: "Done",
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: ((context) => const Registration())));
                },
                textColor: Colors.black87,
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    final mime = await controller?.getFileMIME(event);
    final bytes = await controller?.getFileSize(event);
    final url = await controller?.createFileUrl(event);

    print(name);
    print(mime);
    print(bytes);
    print(url);
  }
}
