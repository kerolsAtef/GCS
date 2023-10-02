import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class ListItem extends StatelessWidget {
  ListItem({
    super.key,
    required this.data,
    required this.header
  });

  String header, data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(data.length>20?"${data.substring(0, 20)}...":data, style: GoogleFonts.cairo(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
          overflow: TextOverflow.clip,
        ),
        Spacer(),
        Text(header, style: GoogleFonts.cairo(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600
        ),
        ),
      ],
    );
  }
}