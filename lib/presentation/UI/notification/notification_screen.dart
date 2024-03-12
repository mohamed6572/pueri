import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pueri/app/cubit/cubit.dart';
import 'package:pueri/app/cubit/state.dart';
import 'package:pueri/presentation/UI/location/add_location/add_location.dart';
import 'package:pueri/presentation/resourses/constants/app_constants.dart';

import '../../resourses/styles/colors.dart';
import '../../resourses/styles/styles.dart';

class Notification_Screen extends StatefulWidget {
  Notification_Screen({super.key});

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/back_arrow.png')),
                      SizedBox(
                        width: MediaQuery
                            .sizeOf(context)
                            .width / 3.9,
                      ),
                      Text('Notifications', style: Styles.bold_16.copyWith(
                          color: AppColors.primary, fontSize: 18),),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary)
                    ),
                    child:Text('There are full places in katr ElSheikh university Hospital'),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

}
