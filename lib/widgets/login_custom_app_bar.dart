import 'package:flutter/material.dart';
import'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilies/Colors.dart';

class LoginCustomeAppBar extends StatelessWidget {
   LoginCustomeAppBar({super.key, required this.text});
   String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 25.h,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/logo.png",width: 30.w,height: 15.h,),
          Container(
            alignment: Alignment.center,
            height: 15.h,
            child: Text(text,style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white
            ),),
          )
        ],
      ),
    );
  }
}
