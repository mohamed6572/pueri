import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
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

       AppConstants.onboarding = cashHelper.getData(key: 'onboard') ?? false;
      print(AppConstants.onboarding);
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
