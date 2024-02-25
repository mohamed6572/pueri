import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConstants {
  static void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));

  static void navigateToAndFinish(context, widget) =>
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ),
          (route) => false);

  static void exitApp() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  static bool onboarding =false;
}
