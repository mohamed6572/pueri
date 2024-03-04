import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pueri/presentation/resourses/styles/colors.dart';

import '../styles/styles.dart';

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
  static Widget defButton({onTap , text ,color ,condetion,textColor,font})=>      InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color:color,
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child:condetion ? CircularProgressIndicator(color: Colors.white,): Text(
          '$text',
          style: Styles.semi_bold_15.copyWith(fontSize: font,color: textColor)  ,
        ),
      ),
    ),
  );
}
