import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pueri/app/cubit/cubit.dart';

import '../../resourses/styles/colors.dart';
import '../../resourses/styles/styles.dart';

class Doctor_widget extends StatelessWidget {
   Doctor_widget({required this.image_link ,required this.name, required this.onTap });
  String? image_link;
  void Function()? onTap;
  String? name;



  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors.primary)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                   width: 70,
                    child: Image.network('${image_link}'))),
            SizedBox(width: 15,),
            Text(
              '${name}',
              style: Styles.bold_16.copyWith(color: Colors.black),
            ),
           Spacer(),
            Icon(  Icons.arrow_forward_ios_outlined,color: Colors.grey.shade900,size: 15,)
          ],
        ),
      ),
    );
  }
}
