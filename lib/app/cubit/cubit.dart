
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pueri/app/cubit/state.dart';
import 'package:pueri/presentation/UI/doctor/doctor.dart';
import 'package:pueri/presentation/UI/home/home.dart';
import 'package:pueri/presentation/UI/login/login_screen.dart';
import 'package:pueri/presentation/UI/message/message.dart';
import 'package:pueri/presentation/UI/profile/profile.dart';
import 'package:pueri/presentation/UI/watch/watch.dart';
import 'package:pueri/presentation/resourses/models/user/user_model.dart';

import '../../presentation/resourses/constants/app_constants.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppIniteal());

  static AppCubit get(context) => BlocProvider.of(context);
  int bottomNavIndex =0;
  List<Widget> App_Screens =[
    HomeScreen(),
    Doctor_Screen(),
    Watch_Screen(),
    Message_Screen(),
    Profile_Screen()

  ];

  void ChangeBottomBarIndex(index){
    bottomNavIndex =index;
    emit(ChangeBottomNavBarState());
  }
  Future<void> signUpAndStoreUserData({
    required String email,
    required String password,
    required String name,
    required  context,
  }) async {
    emit(SignUpLodingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;
      print(uid);

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'password': password,
        'id': uid,

      }).then((value) {
        emit(GetUserDataLodingState());
        getUserData(FirebaseAuth.instance.currentUser?.uid);
        emit(SignUpSucssesState());
      });

      print('User signed up and data stored successfully');
    } catch (e) {
      emit(SignUpErrorState());
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          // Show a Snackbar when the email is already in use

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text( textAlign:TextAlign.center,

                  'email-already-in-use' ,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );


        }
        else if (e.code == 'too-many-requests') {
          // Show a Snackbar when the password is incorrect

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(textAlign:TextAlign.center,

                  'too-many-request' ,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );

        } else if (e.code == 'weak-password') {
          // Show a Snackbar when the password is too weak
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text( textAlign:TextAlign.center,

                  'weak-password' ,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );


        } else {
          // Handle other FirebaseAuth errors
          print('FirebaseAuth error during user sign-up: ${e.message}');
        }
      }

      else if (e is FirebaseException && e.code == 'network-request-failed') {
        // Show a Snackbar for network/connection error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text( textAlign:TextAlign.center,

                '5eu08qdd' ,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
            duration: Duration(seconds: 3), // Adjust the duration as needed
          ),
        );

      } else {
        // Handle other errors
        print('Error during user sign-up: $e');
      }
      throw e;
    }
  }
  Future<void> signIN({
    required String email,
    required String password,
    required  context,

  }) async {
    emit(SignINLodingState());
    try {


      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
        emit(GetUserDataLodingState());
        getUserData(value.user?.uid);
        emit(SignINSucssesState());
      });

      print('User signed up and data stored successfully');
    } catch (e) {
      emit(SignINErrorState());
      if (e is FirebaseAuthException) {
        print(e.code);
        if (e.code == 'user-not-found') {
          // Show a Snackbar when email is not found
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text( textAlign:TextAlign.center,

                  'المستخدم غير موجود' ,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'wrong-password') {
          // Show a Snackbar when the password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text( textAlign:TextAlign.center,
                  'الباسورد خطا' ,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );
        } else if (e.code == 'too-many-requests') {
          // Show a Snackbar when the password is incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text( textAlign:TextAlign.center,

                  'عدد معاملات كثيره يرجا الانتظار قليلا' ,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            ),
          );

        } else {
          // Handle other FirebaseAuth errors
          print('FirebaseAuth error during user sign-in: ${e.message}');
        }
      } else if (e is FirebaseException && e.code == 'network-request-failed') {
        // Show a Snackbar for network/connection error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text( textAlign:TextAlign.center,

                'يرجا مراجعه الاتصال الخاص بك' ,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white)),
            duration: Duration(seconds: 3), // Adjust the duration as needed
          ),
        );

      } else {
        // Handle other errors
        print('Error during user sign-in: $e');
      }


    }
  }
  void SignOut(context){
    FirebaseAuth.instance.signOut().then((value) {
      print(FirebaseAuth.instance.currentUser);
      AppConstants.navigateToAndFinish(context, Login_screen());
      emit(SignOutSucssesState());
    }).catchError((error) {
      emit(SignOutErrorState());
    });
  }
User_Model? user_model ;
  void getUserData(uid){

    emit(GetUserDataLodingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {

      print(value.data());
      user_model = User_Model.fromJson(value.data()!);
      print(user_model?.name);
      emit(GetUserDataSucssesState());
    }).catchError((error) {
      emit(GetUserDataErrorState());
    });
  }
}
