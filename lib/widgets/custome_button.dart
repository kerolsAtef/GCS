import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../utilies/Colors.dart';


class Button extends StatelessWidget {
  Button({
    super.key,
    required this.fun,
    required this.text,
  });

  String text;
  VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: fun,
        child: Container(
          alignment: Alignment.center,
          width: 70.w,
          height: 6.h,
          decoration: BoxDecoration(
              borderRadius:BorderRadius.all(Radius.circular(30)),
              color: mainColor
          ),
          child: Text(text,style: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),),
        ),
      ),
    );
  }
}