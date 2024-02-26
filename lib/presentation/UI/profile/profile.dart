import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pueri/presentation/resourses/styles/colors.dart';

import '../../../app/cubit/cubit.dart';
import '../../../app/cubit/state.dart';


class Profile_Screen extends StatefulWidget {
  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {

  Future<void> _refreshData(BuildContext context) async {
    AppCubit.get(context).getUserData(AppCubit.get(context).user_model?.id);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var cubit  =AppCubit.get(context);

        return Scaffold(
          appBar:AppBar(),

          body:RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () => _refreshData(context),
              child: state is GetUserDataLodingState ?Center(child: CircularProgressIndicator(),): BuildCondition(
                builder: (context) => Container(color: Colors.green,),
                fallback: (context) => Center(child: CircularProgressIndicator(),),
                condition:true, //cubit.student_model !=null,
              )),
        );
      },
    );
  }
}
