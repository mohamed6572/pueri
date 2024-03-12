
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pueri/presentation/UI/payment/widgets/payment_details_view_body.dart';

import '../../../app/cubit/cubit.dart';
import '../../../app/cubit/state.dart';



class PaymentsDetailsView extends StatelessWidget {
  const PaymentsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(

          body: PaymentDetailsViewBody(),
        );
      },
    );
  }
}
