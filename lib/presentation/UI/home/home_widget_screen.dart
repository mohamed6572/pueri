
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pueri/presentation/resourses/constants/app_constants.dart';
import 'package:pueri/presentation/resourses/models/hospital_model/hospital_model.dart';
import 'package:pueri/presentation/resourses/styles/colors.dart';
import 'package:pueri/presentation/resourses/styles/styles.dart';

import '../../../app/cubit/cubit.dart';
import '../../../app/cubit/state.dart';
import 'home_components.dart';

class Home_Widget_Screen extends StatefulWidget {
  Home_Widget_Screen({required this.model});
  Hospital_Model? model;
  @override
  State<Home_Widget_Screen> createState() => _Home_Widget_ScreenState();
}

class _Home_Widget_ScreenState extends State<Home_Widget_Screen> {



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

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Home_widget(
                        hospital_name:
                        '${widget.model?.hospital_name}',
                        beds: widget.model!.avilable!,
                        id: widget.model?.id!,
                        location: '${widget.model?.location}',
                        rate: widget.model?.rate!,
                        supported: widget.model!.supported!,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width-40,
                        height: 111,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: image_list.length,
                          itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset('${image_list[index]}')),
                          );
                        },),

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppConstants.defButton(
                              color:widget.model?.avilable =='0' ? Colors.grey: AppColors.primary,
                              onTap: () {

                              },
                              text: 'Book',
                              condetion: false,
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
List<String> image_list = [
  'assets/images/hospital_image1.png',
  'assets/images/hospital_image2.png',
];
}
