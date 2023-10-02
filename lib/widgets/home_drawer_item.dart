import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class DrawerItem extends StatelessWidget {
  DrawerItem({
    super.key,
    required this.text,
    required this.fun
  });
  String text;
  VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(text,style: GoogleFonts.cairo(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),),
        onTap: fun
    );
  }
}


