import 'package:flutter/material.dart';
import 'package:kosankuy/app/components/my_color.dart';
import 'package:kosankuy/app/components/my_label.dart';

class MyButtonComponent {
  static Widget buttonFlat(BuildContext context, Function callback,
      {String? text,
      double? elevation,
      double? width,
      double? height,
      Color? backgroundColor,
      Color? textColor,
      double? fontSize,
      FontWeight? fontWeight}) {
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        height: height ?? MediaQuery.of(context).size.height * 0.07,
        width: width ?? double.infinity,
        child: ElevatedButton(
          onPressed: () {
            callback();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                backgroundColor ?? MyColor.hexToColor(MyColor.greenYoung),
            elevation: elevation ?? 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          child: MyLabelComponent.show(
              text: text ?? '-',
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400),
        ));
  }

  static Widget buttonOutline(BuildContext context, Function callback,
      {String? title, Color? color, double? fontSize}) {
    return GestureDetector(
      child: Container(
          // height: 100,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(
                color: color ?? MyColor.hexToColor(MyColor.greenYoung),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: MyLabelComponent.show(
                    text: title ?? "-",
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize ?? 14,
                    color: color ?? MyColor.hexToColor(MyColor.greenYoung),
                    textAlign: TextAlign.right),
              ),
              // SizedBox(
              //   width: 30,
              //   child: Icon(
              //     Icons.keyboard_arrow_right,
              //     color: color ?? MyColor.hexToColor(MyColor.iconColor),
              //   ),
              // ),
            ],
          )),
      onTap: () {
        callback();
      },
    );
  }

  static Widget buttonOutlineCenter(BuildContext context, Function callback,
      {String? title, Color? color}) {
    return GestureDetector(
      child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(
                color: color ?? MyColor.hexToColor(MyColor.iconColor),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Center(
                  child: MyLabelComponent.show(
                    text: title ?? "-",
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: color ?? MyColor.hexToColor(MyColor.iconColor),
                  ),
                )),
          )),
      onTap: () {
        callback();
      },
    );
  }
}
