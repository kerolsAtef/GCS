import 'package:flutter/material.dart';
import 'package:gcs_new/login/login_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../utilies/Strings.dart';
import '../forget_password/insert_email_view.dart';


class RememberMeAndForgetPassword extends StatelessWidget {
  const RememberMeAndForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: (){
           // Get.to(()=>ForgetPasswordView1());
          },
          child: Text(ForgetPassword,style: GoogleFonts.cairo(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),),
        ),
        Spacer(),
        GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller)=>
           Checkbox(value: controller.CheckBoxV, onChanged: (value){
            controller.ChangeCheckBoxValue(value!);
          }),
        ),
        Text(RemeberMe,style: GoogleFonts.cairo(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),),
      ],
    );
  }
}
