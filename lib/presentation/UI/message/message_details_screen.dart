import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pueri/presentation/resourses/constants/app_constants.dart';
import 'package:pueri/presentation/resourses/styles/colors.dart';
import 'package:pueri/presentation/resourses/styles/styles.dart';

import '../../../app/cubit/cubit.dart';
import '../../../app/cubit/state.dart';

class Message_Details_Screen extends StatefulWidget {
  @override
  State<Message_Details_Screen> createState() => _Message_Details_ScreenState();
}

class _Message_Details_ScreenState extends State<Message_Details_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }var controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
            body: SafeArea(
          child: Column(
            children: [
              Container(

                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                color: AppColors.primary,
                child: Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/back_arrow.png',color: Colors.white,)),
                    SizedBox(width: 10,),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                            width: 40,
                            child: Image.network(
                              'https://media.istockphoto.com/id/177373093/photo/indian-male-doctor.jpg?s=612x612&w=0&k=20&c=5FkfKdCYERkAg65cQtdqeO_D0JMv6vrEdPw3mX1Lkfg=',
                            ))),
                    SizedBox(width: 10,),
                    Text('Dr.Omar',style: Styles.semi_bold_15,),
                    Spacer(),
                    SizedBox(
                        width: 40,
                        child: Image.asset(
                          'assets/images/icon_phone.png',color: Colors.white,
                        )),
                    SizedBox(width: 5,),

                    SizedBox(
                        width: 40,
                        child: Image.asset(
                          'assets/images/vidio.png',color: Colors.white,
                        )),
                  ],
                ),
              ),
              Expanded(child: Column(
                children: [
                  message_widget('To day'),
                  Align(
                      alignment: Alignment.centerRight,
                      child: message_widget('اخبار الطفل اي')),
                  Align(

                      alignment: Alignment.centerLeft,
                      child: message_widget('الطفل بخير')),

                ],
              )),
              Container(

color: AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  children: [
                    SizedBox(height: 50,
                      width: MediaQuery.sizeOf(context).width/1.7,
                      child: TextFormField(
                        style: Styles.semi_bold_14,
                        controller: controler,
                        maxLines: 1,
                        minLines: null,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return 'please enter message';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color:  Colors.white)),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Colors.red)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color:  Colors.white)),
                            hintText: 'Message',
                            fillColor: Colors.white,
                            filled: true,

                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:  Colors.white),
                                borderRadius:
                                BorderRadius.circular(50)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:  Colors.white),
                                borderRadius:
                                BorderRadius.circular(50))),
                      ),
                    ),
                    SizedBox(width: 5,),
                    SizedBox(
                        width: 40,
                        child: Image.asset(
                          'assets/images/cam.png',color: Colors.white,
                        )),  SizedBox(width: 5,),
                    SizedBox(
                        width: 40,
                        child: Image.asset(
                          'assets/images/vidio.png',color: Colors.white,
                        )),
                  ],
                ),
              ),

            ],
          ),
        ));
      },
    );
  }
  Widget message_widget(text)=> Container(
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),

    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Text(text,style: Styles.semi_bold_14.copyWith(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
  );
}
