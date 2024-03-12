import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pueri/presentation/resourses/Bloc_Observer.dart';
import 'package:pueri/presentation/resourses/constants/app_constants.dart';
import 'package:pueri/presentation/resourses/network/local/casheHelper.dart';

import 'app/MyApp.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await cashHelper.Init();
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        // Handle message when the app is in the background or terminated
        if (message != null) {
          // Handle notification message
          AppConstants.handleNotification(message);
        }
      });

      // Handle incoming messages
      FirebaseMessaging.onMessage.listen((message) {
        // Handle notification message
        AppConstants. handleNotification(message);
      });

      // Handle messages clicked / opened from notification tray
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        // Handle notification message
        AppConstants.handleNotification(message);
      });



       AppConstants.onboarding = cashHelper.getData(key: 'onboard') ?? false;
      print(AppConstants.onboarding);
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      print(' token : ${fcmToken}');
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
