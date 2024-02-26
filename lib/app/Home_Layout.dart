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


class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  Future<void> _refreshData(BuildContext context) async {
    AppCubit.get(context).getUserData(FirebaseAuth.instance.currentUser?.uid);

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var cubit  =AppCubit.get(context);

        return Scaffold(

            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primary,
              shape: CircleBorder(),
              elevation: 0.0,
              onPressed: () {
                cubit.ChangeBottomBarIndex(2);
              },child:SvgPicture.asset('assets/icons/watch.svg',color: cubit.bottomNavIndex==2 ? Colors.black : Colors.white,),
              //params
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.primary,type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              currentIndex: cubit.bottomNavIndex,

              onTap: (i){
                if(i!=2)
                  cubit.ChangeBottomBarIndex(i);
              },
              items: [
                BottomNavigationBarItem(icon:SvgPicture.asset('assets/icons/home.svg',color: cubit.bottomNavIndex==0 ? Colors.black : Colors.white,),label: 'Home',backgroundColor: AppColors.primary),
                BottomNavigationBarItem(icon:SvgPicture.asset('assets/icons/doctor.svg' ,color:cubit.bottomNavIndex==1 ? Colors.black : Colors.white,),label: 'Doctor'),
                BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.transparent,),label: ''),
                BottomNavigationBarItem(icon:SvgPicture.asset('assets/icons/message.svg',color: cubit.bottomNavIndex==3 ? Colors.black : Colors.white,),label: 'Message'),
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/profile.svg',color: cubit.bottomNavIndex==4 ? Colors.black : Colors.white,),label: 'Profile'),
              ],
            ),
            // bottomNavigationBar: AnimatedBottomNavigationBar(
            //   icons: [
            //     Icons.content_copy_rounded,
            //     Icons.content_copy_rounded,
            //     Icons.content_copy_rounded,
            //     Icons.content_copy_rounded,
            //   ],
            //   activeIndex: 0,
            //   gapLocation: GapLocation.center,
            //   notchSmoothness: NotchSmoothness.sharpEdge,
            //   leftCornerRadius: 50,
            //   backgroundColor:AppColors.primary,
            //   rightCornerRadius: 50,
            //   onTap: (index) => setState(() => _bottomNavIndex = index),
            //   //other params
            // ),
            body:RefreshIndicator(
                onRefresh: () {
                 return _refreshData(context) ;
                },
                child: cubit.App_Screens[cubit.bottomNavIndex])
        );
      },
    );
  }
}
