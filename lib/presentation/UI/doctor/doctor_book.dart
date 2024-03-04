import 'dart:async';
import 'dart:ffi';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pueri/presentation/resourses/constants/app_constants.dart';
import 'package:pueri/presentation/resourses/styles/colors.dart';
import 'package:pueri/presentation/resourses/styles/styles.dart';

import '../../../app/cubit/cubit.dart';
import '../../../app/cubit/state.dart';
import '../../resourses/models/hospital_model/hospital_model.dart';
import 'doctor_components.dart';
import 'doctor_view_all.dart';

class Doctor_Book extends StatefulWidget {
  @override
  State<Doctor_Book> createState() => _Doctor_BookState();
}

class _Doctor_BookState extends State<Doctor_Book> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<String> h = [
    '10:00 AM',
    '11:00 AM',
    '8:00 PM',
    '9:00 PM',
  ];
  List<String> d = [
    'Sun 4',
    'Mon 4',
    'Tue 6',
    'Wen 7',
  ];
int d_index =0;
int h_index =0;
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/back_arrow.png')),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.email_rounded,
                            color: AppColors.primary,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.primary)
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(25),

                            child: Image.network('https://media.istockphoto.com/id/177373093/photo/indian-male-doctor.jpg?s=612x612&w=0&k=20&c=5FkfKdCYERkAg65cQtdqeO_D0JMv6vrEdPw3mX1Lkfg=',
                            width: 80,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(width:
                            10),
                            Text(
                              'Dr. Charollette Baker',
                              style: Styles.semi_bold_16.copyWith(color: Color(0xff091F44)),
                            ),   Text(
                              'Pediatrician',
                              style: Styles.reguler_12.copyWith(color: Color(0xff091F44)),
                            ),
                            Image.asset('assets/images/patients.png')


                          ],
                        ),




                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  date_widget(text: 'Working Hours', onTap: () {}, list: h),
                  SizedBox(
                    height: 10,
                  ),
                  date_widget(text: 'Date', onTap: () {}, list: d,indexx:d_index),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppConstants.defButton(
                          color: AppColors.primary,
                          onTap: () {
              
                          },
                          text: 'Books',
                          condetion: false,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: AppConstants.defButton(
                          color: Colors.white,
                          onTap: () {
                          },
                          textColor: AppColors.primary,
                          text: 'Massage',
                          condetion:false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.primary)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
              
                            SizedBox(width:
                            10),
                            Text(
                              'Location',
                              style: Styles.semi_bold_16.copyWith(color: Colors.grey),
                            ),
              
              
                          ],
                        ),
              
                          SizedBox(
                            height: 15,
                          ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset('assets/images/map.png'))
              
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }

  Widget date_widget({onTap, text, required List<String> list,indexx}) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Styles.semi_bold_14,
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  'See All',
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
          Container(
            height: 52,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return InkWell(onTap: (){
                  setState(() {
                    if( text =='Date')
                    d_index =index;
                    if( text !='Date')
                    h_index =index;
                   print(d_index==index);
                  });

                },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color:text =='Date' ?d_index==index?  AppColors.primary:Colors.grey :  h_index ==index ?  AppColors.primary:Colors.grey,
                        borderRadius: BorderRadius.circular(18)),
                    height: 50,
                    width: 98,
                    child: Center(
                      child: Text(
                        '${list[index]}',
                        style: Styles.reguler_12
                            .copyWith(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      );
}
