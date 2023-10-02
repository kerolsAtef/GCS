import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../dash_board/dash_board.dart';
import '../utilies/Strings.dart';
import '../widgets/login_custom_app_bar.dart';
import '../widgets/forget_password_board.dart';

class ForgetPasswordView1 extends StatelessWidget {
   ForgetPasswordView1({super.key});
   DashBoard con=Get.put(DashBoard());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(child: LoginCustomeAppBar(text: OrganizationName,),
              top: 0,
              left: 0,
            ),
            Positioned(
                top: 20.h,
                left: 10.w,
                right: 10.w,
                // here there is on UI Page for inserting email and inserting (otp, new password page)
                // if is first true will load insert email part
                child: ForgetPasswordBoard(isFirstView: true,))
          ],
        ),
      ),
    );
  }
}
