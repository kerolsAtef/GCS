import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../utilies/Colors.dart';
import '../login/login_view.dart';
import 'dashController.dart';

class DashBoard extends  StatelessWidget {
  final controller=Get.put(DashController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(()=>LoginView());
    });
    return SafeArea(child: Container(
        width: double.infinity,
        height: 100.h,
        color: mainColor,
        child: Center(
          child: Image.asset("assets/images/logo.png",width: 40.w,height: 20.h,),
        ),
    ));
  }
}
