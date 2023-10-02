import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchCustomHeader extends StatelessWidget {
  SearchCustomHeader({
    super.key,
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w),
      child: Text(text,style: GoogleFonts.cairo(
          fontSize: 10.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),),
    );
  }
}