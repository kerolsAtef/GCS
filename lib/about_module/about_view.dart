import 'package:flutter/material.dart';
import 'package:gcs_new/dash_board/dash_board.dart';
import 'package:gcs_new/home_module/home_view.dart';
import 'package:gcs_new/utilies/Strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../widgets/custome_button.dart';
import '../widgets/login_custom_app_bar.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
   AboutScreen({super.key});

   DashBoard con=Get.put(DashBoard());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(child: LoginCustomeAppBar(text: AboutUs,),top: 0,left: 0,),
          Positioned(
            top: 18.h,
            left: 10.w,
            right: 10.w,
            child: Card(
              elevation: 10,
              child: Container(
                width: 80.w,
                height: 60.h,
                child: Column(
                  children: [
                    SizedBox(height: 2.h,),
                    Text(OrganizationName,style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 2.h,),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(AboutParagraph,style: GoogleFonts.cairo(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                    SizedBox(height: 5.h,),
                    Button(text: Back,fun: (){
                      Get.off(()=>HomeView());
                    },)
                  ],
                ),
              ),
            ),
          )
        ],

      ),
    ));
  }
}
