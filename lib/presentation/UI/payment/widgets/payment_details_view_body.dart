import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resourses/styles/colors.dart';
import '../../../resourses/styles/styles.dart';
import 'customButton.dart';
import 'custom_creditcard.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 20,)),
          SliverToBoxAdapter(child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/images/back_arrow.png')),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width/3.9,
                ),
                Text('Payment',style: Styles.bold_16.copyWith(color: AppColors.primary,fontSize: 18),),
              ],
            ),
          ),),
          SliverToBoxAdapter(child: CustomCreditcard(
            formKey: formKey,
              autovalidateMode: autovalidateMode
          )),
      
          SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                padding: const EdgeInsets.only(bottom:12,right: 16,left: 16 ),
                child: customButton(onTap: () {
      
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ThankYouView(),));
                }, title: 'Pay : 10.000 EGP'),
              ))),
        ],
      ),
    );
  }
}
