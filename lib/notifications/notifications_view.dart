import 'package:flutter/material.dart';
import 'package:gcs_new/utilies/Colors.dart';
import 'package:gcs_new/utilies/cash_data.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../dash_board/dash_board.dart';
import '../home_module/home_controller.dart';
import '../utilies/Strings.dart';
import '../widgets/custom_button_nav_bar.dart';

class NotificationView extends StatelessWidget {
   NotificationView({super.key});
   HomeController con=Get.put(HomeController());
   DashBoard con1=Get.put(DashBoard());


   @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      bottomNavigationBar: CustomeBottomNavBar(selectedIndex: 2,),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(notificationText,style: GoogleFonts.cairo(
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: Colors.white
        ),),
      ),
      body:CashData.notificationsList==null || CashData.notificationsList.isEmpty? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/no_data.jpg",width: 50.w,height: 20.h,),
            Text("لا توجد أشعارات لعرضها", style: GoogleFonts.cairo(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple
            ),),
          ],
        ),
      ):ListView.builder(
        itemCount: CashData.notificationsList.length,
          itemBuilder: (context,index){
        return Card(
          elevation: 10,
          child: Container(
            width: 95.w,
            height: 10.h,
            margin: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 1.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(con.ToDate(CashData.notificationsList[index].date).toString(), style: GoogleFonts.cairo(
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),),
                ),
                Text(CashData.notificationsList[index].title, style: GoogleFonts.cairo(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ),),
                Text(CashData.notificationsList[index].link, style: GoogleFonts.cairo(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
                overflow:TextOverflow.clip ,
                ),
              ],
            ),
          ),
        );
      })
    ));
  }
}
