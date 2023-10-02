import 'package:flutter/material.dart';
import'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilies/Colors.dart';
import '../utilies/Strings.dart';
class HomeCustomAppBar extends StatelessWidget {
   HomeCustomAppBar({super.key,required this.text, required this.fun});
    String text;
   VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      width: 100.w,
      height: 15.h,
      decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: fun,
            icon: Icon(Icons.menu,color: Colors.white,),),
          Spacer(),
          Column(
             children: [
               Image.asset("assets/images/logo.png",width: 20.w,height: 7.h,),
               Text(text,style: GoogleFonts.cairo(
                   fontSize: 12.sp,
                   fontWeight: FontWeight.w700,
                   color: Colors.white
               ),)
             ],
           ),

        ],
      ),
    );
  }
}
