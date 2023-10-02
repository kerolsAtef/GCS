import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalField extends StatelessWidget {
  PersonalField({
    super.key,
    required this.title,
    required this.data,
  });
  String title, data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,style: GoogleFonts.cairo(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black
        ),),
        Container(
          height: 7.h,
          width: 100.w,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal:10.w),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue, // Change this to the desired border color
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: Text(data, style: GoogleFonts.cairo(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.blueAccent
          ),),
        ),
      ],
    );
  }
}