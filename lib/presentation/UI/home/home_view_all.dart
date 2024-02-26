import 'package:flutter/material.dart';

import '../../resourses/styles/colors.dart';
import '../../resourses/styles/styles.dart';
import 'home_components.dart';

class Home_View_All extends StatelessWidget {
  Home_View_All({super.key});

  var searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/back_arrow.png')),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
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
                    prefixIcon: Image.asset('assets/images/search.png'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: AppColors.primary)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.red)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: AppColors.primary)),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => Home_widget(
                  hospital_name: 'katr ElSheikh university Hospital',
                  beds: 2,
                  favorite: true,
                  location: 'Kafr El Sheikh, Kafr El Sheikh, ElGish Street',
                  rate: 5.0,
                  supported: true,
                ),
                itemCount: 10,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
