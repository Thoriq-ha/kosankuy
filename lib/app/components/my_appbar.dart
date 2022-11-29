import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kosankuy/app/components/my_color.dart';
import 'package:kosankuy/app/components/my_label.dart';

class MyAppBarComponent {
  static AppBar buildNormal(BuildContext context, String? title,
      {Function? callback, Color? bgColor, Color? titleColor, bool? center}) {
    return AppBar(
      centerTitle: center ?? true,
      title: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Text(
          title ?? '-',
          // style: TextStyle(
          //     color: titleColor ??
          //         MyColor.hexToColor(MyColor.titleGreyColorMenuTitle),
          //     fontSize: 16
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: titleColor ??
                    MyColor.hexToColor(MyColor.titleGreyColorMenuTitle),
                fontSize: 16),
          ),
        ),
      ),
      backgroundColor: bgColor ?? MyColor.hexToColor(MyColor.white),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color:
              titleColor ?? MyColor.hexToColor(MyColor.titleGreyColorMenuTitle),
        ),
        onPressed: () {
          if (callback != null) {
            callback();
          } else {
            Get.back();
          }
        },
      ),
    );
  }

  static AppBar buildNormalWithoutLeading(BuildContext context, String? title,
      {Color? bgColor, Color? titleColor, bool? center}) {
    return AppBar(
      centerTitle: center ?? false,
      title: Text(
        title ?? '-',
        //   style: TextStyle(
        //     color:
        //         titleColor ?? MyColor.hexToColor(MyColor.titleGreyColorMenuTitle),
        //     fontSize: 16,
        //   ),
        // ),
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: titleColor ??
                MyColor.hexToColor(MyColor.titleGreyColorMenuTitle),
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: bgColor ?? MyColor.hexToColor(MyColor.white),
      elevation: 0,
    );
  }

  static AppBar buildWithNotification(String? title, Function callback,
      {String? counterNotif}) {
    return AppBar(
      title: Text(title ?? '-',
          // style: TextStyle(
          //     color: MyColor.hexToColor(MyColor.colorTitle),
          //     fontWeight: FontWeight.bold,
          //     fontSize: 16),
          // ),
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: MyColor.hexToColor(MyColor.colorTitle),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          )),
      backgroundColor: MyColor.hexToColor(MyColor.white),
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            icon: Icon(
              Icons.notifications,
              color: MyColor.hexToColor(MyColor.grey),
            ),
            onPressed: () {
              callback();
            }),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: Text(
                counterNotif ?? '-',
                style: TextStyle(
                    color: Colors.orange[400],
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
            )
          ],
        )
      ],
    );
  }
}
