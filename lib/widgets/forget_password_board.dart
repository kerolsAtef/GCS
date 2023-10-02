import 'package:gcs_new/utilies/Colors.dart';
import 'package:gcs_new/widgets/remember_me_and_forget_pass_row.dart';
import 'package:gcs_new/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../utilies/Strings.dart';
import '../login/login_view.dart';
import 'custome_button.dart';

class ForgetPasswordBoard extends StatelessWidget {
   ForgetPasswordBoard({super.key,
   required this.isFirstView
   });

   bool isFirstView;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController mailController=new TextEditingController();
    TextEditingController passController=new TextEditingController();
    TextEditingController otpController=new TextEditingController();
    TextEditingController rePassController=new TextEditingController();

    return Form(
      key: _formKey,
      child: Card(
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
          width: 80.w,
          height: 60.h,
          child:isFirstView? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 6.h,),
              Text(ReAssignPasswordText,style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: mainColor,
              ),),
              SizedBox(height: 2.h,),
              TextFieldCustomization(icon: Icon(Icons.email_outlined),controller: mailController,hint: EmailString,isObscure: false),
              SizedBox(height: 5.h,),
              Button(text: Continue,fun: (){
                Get.off(()=>ForgetPasswordBoard(isFirstView: false,));
              },),
              SizedBox(height: 2.h,),
              Button(text: Back,fun: (){
                Get.offAll(()=>LoginView());
              },),
            ],
          ): Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 2.h,),
              Text(ReAssignPasswordText,style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: mainColor,
              ),),
              SizedBox(height: 2.h,),
              TextFieldCustomization(icon: Icon(Icons.lock),controller: otpController,hint: OTP,isObscure: false,),
              SizedBox(height: 1.h,),
              TextFieldCustomization(icon: Icon(Icons.key),controller: passController,hint: NewPass,isObscure: true),
              SizedBox(height: 1.h,),
              TextFieldCustomization(icon: Icon(Icons.key),controller: rePassController,hint: RenewPass,isObscure: true),
              SizedBox(height: 3.h,),
              Button(text: AssignNewPass,fun: (){

              },),
              SizedBox(height: 2.h,),
              Button(text: Back,fun: (){
                Get.offAll(()=>LoginView());
              },),
            ],
          ),
        ),
      ),
    );
  }
}


