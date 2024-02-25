import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pueri/app/cubit/cubit.dart';
import 'package:pueri/presentation/UI/login/login_screen.dart';
import 'package:pueri/presentation/resourses/constants/app_constants.dart';

import '../presentation/UI/splash/splash.dart';
import 'cubit/state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData(FirebaseAuth.instance.currentUser?.uid),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
           home: Splash_Screen(),
         // home: Otp_Screen(),
            title: 'Cridet Hour Sytem',
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
