import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  final Widget smallScreen;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    required this.smallScreen,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  static bool issmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 350;
  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is less than 350 then we consider it a small screen. Rare case
    if (_size.width <= 350) {
      return smallScreen;
    }
    // If our width is more than 1100 then we consider it a desktop
    else if (_size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
