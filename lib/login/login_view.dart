import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../dash_board/dashController.dart';
import '../utilies/Strings.dart';
import '../widgets/login_custom_app_bar.dart';
import '../widgets/login_board.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});

   final controller=Get.put(DashController());

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
                child: LoginBoard())
          ],
        ),
      ),
    );
  }
}
