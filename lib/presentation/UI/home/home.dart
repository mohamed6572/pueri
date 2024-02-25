import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pueri/presentation/resourses/constants/app_constants.dart';
import 'package:pueri/presentation/resourses/styles/colors.dart';
import 'package:pueri/presentation/resourses/styles/styles.dart';

import '../../../app/cubit/cubit.dart';
import '../../../app/cubit/state.dart';
import 'home_components.dart';
import 'home_view_all.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _refreshData(BuildContext context) async {
    AppCubit.get(context).getUserData(FirebaseAuth.instance.currentUser?.uid);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RefreshIndicator(
              onRefresh: () => _refreshData(context),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: Styles.semi_bold_20
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                '${cubit.user_model?.name}',
                                style: Styles.reguler_12
                                    .copyWith(color: Colors.black),
                              )
                            ],
                          ),
                          Image.asset('assets/images/logo.png'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: Styles.semi_bold_14,
                            controller: searchControler,
                            maxLines: 1,
                            minLines: null,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'please enter the search query ';
                              }
                
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon:
                                    Image.asset('assets/images/search.png'),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: AppColors.primary)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide(color: Colors.red)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: AppColors.primary)),
                                hintText: 'Search',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25))),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset('assets/images/notification.png')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/icons/location.svg',
                            color: AppColors.primary),
                        Text(
                          ' Kafr ElSheikh',
                          style: Styles.reguler_12
                              .copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hight Rated Nursery',
                          style: Styles.semi_bold_14,
                        ),
                        InkWell(
                          onTap: (){
                            AppConstants.navigateTo(context, Home_View_All());
                          },
                          child: Text(
                            'View All',
                            style: Styles.semi_bold_14.copyWith(
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Home_widget(
                      hospital_name: 'katr ElSheikh university Hospital',
                      beds: 2,
                      favorite: true,
                      location: 'Kafr El Sheikh, Kafr El Sheikh, ElGish Street',
                      rate: 5.0,
                      supported: true,
                    ),
                    Home_widget(
                      hospital_name: 'Kafr Elsheikh General Hospital',
                      beds: 8,
                      favorite: false,
                      location: 'Kafr El Sheikh, Kafr El Sheikh, Alawkaf Street',
                      rate: 4.0,
                      supported: false,
                    ),
                    Home_widget(
                      hospital_name: 'Elobour Hospital',
                      beds: 12,
                      favorite: true,
                      location: 'Kafr El Sheikh, Kafr El Sheikh, AL ADB Street',
                      rate: 5.0,
                      supported: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
