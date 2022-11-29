import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kosankuy/app/components/my_color.dart';

class MyLabelComponent {
  static Widget show(
      {Color? color,
      required String text,
      double? fontSize,
      FontWeight? fontWeight,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? MyColor.hexToColor(MyColor.black),
      ),
      // style: TextStyle(
      //   fontSize: fontSize ?? 16,
      //   fontWeight: fontWeight ?? FontWeight.normal,
      //   color: color ?? MyColor.hexToColor(MyColor.black),
      // ),

      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
