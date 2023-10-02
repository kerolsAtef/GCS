import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../dash_board/dash_board.dart';
import '../utilies/Strings.dart';
import '../utilies/cash_data.dart';
import '../widgets/login_custom_app_bar.dart';
import '../widgets/personal_field.dart';

class PersonalInfoView extends StatelessWidget {
   PersonalInfoView({super.key});
   DashBoard con=Get.put(DashBoard());


   @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginCustomeAppBar(text: PersonalInfo),
              SizedBox(height: 5.h,),
              PersonalField(title: firstName,data:CashData.person!.firstName),
              SizedBox(height: 2.h,),
              PersonalField(title: lastName,data:CashData.person!.lastName),
              SizedBox(height: 2.h,),
              PersonalField(title: phoneNumber,data:CashData.person!.mobilePhone),
              SizedBox(height: 2.h,),
              PersonalField(title: EmailString,data:CashData.person!.eMailAddress1),
              SizedBox(height: 2.h,),
              PersonalField(title: StateString,data:CashData.person!.governorateName),
              SizedBox(height: 2.h,),
              PersonalField(title: address,data:CashData.person!.address),
              SizedBox(height: 2.h,),
              PersonalField(title: TaxNumber,data:CashData.person!.taxNo),
              SizedBox(height: 2.h,),
            ],
          ),
        ),
      ),
    ));
  }
}


