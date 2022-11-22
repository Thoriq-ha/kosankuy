import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kosankuy/app/components/date_pickers.dart';
import 'package:kosankuy/app/components/my_color.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:signature/signature.dart';

class MyInputComponent {
  static Widget textDatePickerNative(Function callback,
      {required BuildContext context,
      String? hintText,
      String? initVal,
      bool? hoursFormat = false}) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: MediaQuery.of(context).size.height * 0.09,
        child: Material(
            borderRadius: BorderRadius.circular(3),
            shadowColor: Colors.grey,
            elevation: 0,
            child: TextFormField(
              autocorrect: true,
              initialValue: initVal ?? "",
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.search)
                // ,
                hintText: hintText ?? '',
                prefixIcon: GestureDetector(
                  onTap: () {
                    DatePickers.showDateNative(context, (date) {
                      if (hoursFormat == false) {
                        List<String> dataDate = date.toString().split(' ');
                        // print("TES ${dataDate[0].trim().replaceAll('0000-00-00', '')}");
                        callback(
                            dataDate[0].trim().replaceAll('0000-00-00', ''));
                      } else {
                        callback(date);
                      }
                    });
                  },
                  child: Icon(
                    Icons.date_range,
                    color: MyColor.hexToColor(MyColor.iconColor),
                  ),
                ),
                hintStyle: TextStyle(color: MyColor.hexToColor(MyColor.black)),
                filled: true,
                fillColor: MyColor.hexToColor(MyColor.white),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onFieldSubmitted: (value) async {},
              onChanged: (value) {},
              onTap: () {
                DatePickers.showDateNative(context, (date) {
                  if (hoursFormat == false) {
                    List<String> dataDate = date.toString().split(' ');
                    // print("TES ${dataDate[0].trim().replaceAll('0000-00-00', '')}");
                    callback(dataDate[0].trim().replaceAll('0000-00-00', ''));
                  } else {
                    callback(date);
                  }
                });
              },
            )));
  }

  static Widget textDateTimePickerNative(Function callback,
      {required BuildContext context,
      String? hintText,
      String? initVal,
      bool? hoursFormat = false}) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: MediaQuery.of(context).size.height * 0.09,
        child: Material(
            borderRadius: BorderRadius.circular(3),
            shadowColor: Colors.grey,
            elevation: 0,
            child: TextFormField(
              autocorrect: true,
              initialValue: initVal ?? "",
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.search)
                // ,
                hintText: hintText ?? '',
                prefixIcon: GestureDetector(
                  onTap: () {
                    DatePickers.showDateTimeNative(context, (date) {
                      String _hour = int.parse(date.hour.toString()) > 9
                          ? date.hour.toString()
                          : '0' + date.hour.toString();
                      String _minute = int.parse(date.minute.toString()) > 9
                          ? date.minute.toString()
                          : '0' + date.minute.toString();
                      String _time = _hour + ' : ' + _minute;
                      print("TES ${_time}");
                      callback(_time);
                    });
                  },
                  child: Icon(
                    Icons.date_range,
                    color: MyColor.hexToColor(MyColor.iconColor),
                  ),
                ),
                hintStyle: TextStyle(color: MyColor.hexToColor(MyColor.black)),
                filled: true,
                fillColor: MyColor.hexToColor(MyColor.white),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onFieldSubmitted: (value) async {},
              onChanged: (value) {},
              onTap: () {
                DatePickers.showDateTimeNative(context, (date) {
                  String _hour = int.parse(date.hour.toString()) > 9
                      ? date.hour.toString()
                      : '0' + date.hour.toString();
                  String _minute = int.parse(date.minute.toString()) > 9
                      ? date.minute.toString()
                      : '0' + date.minute.toString();
                  String _time = _hour + ' : ' + _minute;
                  print("TES ${_time}");
                  callback(_time);
                });
              },
            )));
  }

  static Widget text(Function callback,
      {required BuildContext context,
      String? hintText,
      String? initVal,
      bool? isPassword}) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        // height: MediaQuery.of(context).size.height * 0.09,
        child: Material(
            borderRadius: BorderRadius.circular(3),
            // shadowColor: Colors.grey,
            elevation: 0,
            child: TextFormField(
              autocorrect: true,
              initialValue: initVal ?? "",
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.search)
                // ,
                hintText: hintText ?? '',
                prefixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.description_outlined,
                    color: MyColor.hexToColor(MyColor.iconColorOff),
                  ),
                ),
                hintStyle:
                    TextStyle(color: MyColor.hexToColor(MyColor.greyYoung)),
                filled: true,
                fillColor: MyColor.hexToColor(MyColor.greySoft),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: MyColor.hexToColor(MyColor.borderInput), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: MyColor.hexToColor(MyColor.borderInput)),
                ),
              ),
              obscureText: isPassword ?? false,
              onFieldSubmitted: (value) async {},
              onChanged: (value) {
                callback(value);
              },
            )));
  }

  static Widget textNumber(
    Function callback, {
    required BuildContext context,
    String? hintText,
    String? initVal,
    bool? isPassword,
    bool? readOnly,
    MaskTextInputFormatter? inputFormatters,
  }) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: MediaQuery.of(context).size.height * 0.09,
        child: Material(
            borderRadius: BorderRadius.circular(3),
            shadowColor: Colors.grey,
            elevation: 0,
            child: TextFormField(
              autocorrect: true,
              initialValue: initVal ?? "",
              keyboardType: TextInputType.number,
              readOnly: readOnly ?? false,
              inputFormatters: [
                inputFormatters ??
                    MaskTextInputFormatter(
                        mask: '###', filter: {"#": RegExp(r'[0-9]')}),
              ],
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.search)
                // ,
                hintText: hintText ?? '',
                prefixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.description_outlined,
                    color: MyColor.hexToColor(MyColor.iconColor),
                  ),
                ),
                hintStyle:
                    TextStyle(color: MyColor.hexToColor(MyColor.colorTitle)),
                filled: true,
                fillColor: MyColor.hexToColor(MyColor.white),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              obscureText: isPassword ?? false,
              onFieldSubmitted: (value) async {},
              onChanged: (value) {
                callback(value);
              },
            )));
  }

  static Widget textArea(Function callback,
      {required BuildContext context,
      String? hintText,
      String? initVal,
      bool? isPassword}) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: MediaQuery.of(context).size.height * 0.09,
        child: Material(
            borderRadius: BorderRadius.circular(3),
            shadowColor: Colors.grey,
            // color: Colors.red,
            elevation: 0,
            child: TextFormField(
              autocorrect: true,
              initialValue: initVal ?? "",
              keyboardType: TextInputType.multiline,
              minLines: null, //Normal textInputField will be displayed
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.search)
                // ,
                hintText: hintText ?? '',
                prefixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.description_outlined,
                    color: MyColor.hexToColor(MyColor.iconColor),
                  ),
                ),
                hintStyle:
                    TextStyle(color: MyColor.hexToColor(MyColor.greyYoung)),
                filled: true,
                fillColor: MyColor.hexToColor(MyColor.white),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              obscureText: isPassword ?? false,
              onFieldSubmitted: (value) async {},
              onChanged: (value) {
                callback(value);
              },
            )));
  }

  static Widget selectBox(
    Function callback,
    BuildContext context, {
    String? initVal,
    String? hintText,
    List<String>? options,
  }) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.08,
        // width: 300,
        margin: const EdgeInsets.only(right: 16, left: 16, top: 8),
        child: InputDecorator(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          child: DropdownButtonHideUnderline(
              child: DropdownButton(
            items: options?.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: initVal,
            hint: Text(hintText ?? 'Pilih'),
            onChanged: (val) {
              callback(val);
            },
          )),
        ));
  }

  static Widget textOutlineNoBorder(Function callback,
      {required BuildContext context,
      String? hintText,
      String? initVal,
      bool? isPassword,
      Widget? prefixIcon,
      Widget? sufixIcon,
      bool? readOnly,
      int? maxLength,
      Color? hintColor,
      TextInputType? inputNumber}) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: 45,
        child: TextFormField(
          autocorrect: true,
          initialValue: initVal ?? "",
          readOnly: readOnly ?? false,
          maxLength: maxLength,
          keyboardType: inputNumber ?? TextInputType.text,
          decoration: InputDecoration(
              hintText: hintText ?? '',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: prefixIcon ?? null,
              hintStyle: TextStyle(
                  color: hintColor ?? MyColor.hexToColor(MyColor.hintInput),
                  fontSize: 12),
              // filled: true,
              // fillColor: MyColor.hexToColor(MyColor.white),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(6.0),
              //       bottomRight: Radius.circular(6.0)),
              //   borderSide: BorderSide(color: MyColor.hexToColor(MyColor.blueTransparant), width: 1),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(6.0)),
              //   borderSide: BorderSide(color: MyColor.hexToColor(MyColor.blueTransparant)),
              // ),
              contentPadding: const EdgeInsets.only(bottom: 11, top: 11),
              suffixIcon: sufixIcon ?? null),
          obscureText: isPassword ?? false,
          onFieldSubmitted: (value) async {},
          onChanged: (value) {
            callback(value);
          },
        ));
  }

  static Widget textDatePickerNativeNoBorder(Function callback,
      {required BuildContext context,
      String? hintText,
      String? initVal,
      bool? hoursFormat = false,
      Widget? prefixIcon,
      Widget? suffixIcon,
      bool? readOnly,
      Color? hintColor}) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: MediaQuery.of(context).size.height * 0.09,
        child: Material(
            borderRadius: BorderRadius.circular(3),
            shadowColor: Colors.grey,
            elevation: 0,
            child: TextFormField(
              autocorrect: true,
              initialValue: initVal ?? "",
              readOnly: readOnly ?? false,
              decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.search)
                  // ,
                  hintText: hintText ?? '',
                  prefixIcon: prefixIcon ?? null,
                  suffixIcon: suffixIcon ?? null,
                  hintStyle: TextStyle(
                      color: hintColor ?? MyColor.hexToColor(MyColor.greyYoung),
                      fontSize: 12)),
              onFieldSubmitted: (value) async {},
              onChanged: (value) {},
              onTap: () {
                DatePickers.showDateNative(context, (date) {
                  if (hoursFormat == false) {
                    List<String> dataDate = date.toString().split(' ');
                    // print("TES ${dataDate[0].trim().replaceAll('0000-00-00', '')}");
                    callback(dataDate[0].trim().replaceAll('0000-00-00', ''));
                  } else {
                    callback(date);
                  }
                });
              },
            )));
  }

  static Widget textOutline(Function callback,
      {required BuildContext context,
      String? hintText,
      String? initVal,
      bool isPassword = false,
      Widget? prefixIcon,
      Widget? sufixIcon,
      Color? borderSideColor,
      bool? readOnly,
      bool onTap = false,
      TextInputType? inputType,
      double? paddLeft,
      double? paddRight,
      Color? fillColor,
      Color? hintColor,
      double? height,
      TextEditingController? controller}) {
    return onTap == false
        ? Container(
            padding:
                EdgeInsets.only(left: paddLeft ?? 16, right: paddRight ?? 16),
            child: TextFormField(
              autocorrect: true,
              readOnly: readOnly ?? false,
              initialValue: initVal ?? "",
              keyboardType: inputType ?? TextInputType.text,
              decoration: InputDecoration(
                  hintText: hintText ?? '',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: prefixIcon,
                  hintStyle: TextStyle(
                    color: hintColor ?? MyColor.hexToColor(MyColor.hintInput),
                  ),
                  filled: true,
                  fillColor: fillColor ?? MyColor.hexToColor(MyColor.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                        color: borderSideColor ??
                            MyColor.hexToColor(MyColor.borderInput),
                        width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                        color: borderSideColor ??
                            MyColor.hexToColor(MyColor.borderInput)),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 10.0),
                  suffixIcon: sufixIcon),
              obscureText: isPassword,
              onFieldSubmitted: (value) async {
                callback(value);
              },
              onChanged: (value) {
                callback(value);
              },
            ))
        : Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 45,
            child: TextFormField(
                autocorrect: true,
                readOnly: readOnly ?? false,
                initialValue: initVal ?? "",
                decoration: InputDecoration(
                    hintText: hintText ?? '',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: prefixIcon ?? null,
                    hintStyle: TextStyle(
                        color: MyColor.hexToColor(MyColor.hintInput),
                        fontSize: 12),
                    filled: true,
                    fillColor: MyColor.hexToColor(MyColor.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(
                          color: borderSideColor ??
                              MyColor.hexToColor(MyColor.blueTransparant),
                          width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(
                          color: borderSideColor ??
                              MyColor.hexToColor(MyColor.blueTransparant)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 14),
                    suffixIcon: sufixIcon ?? null),
                obscureText: isPassword,
                onFieldSubmitted: (value) async {},
                onChanged: (value) {
                  callback(value);
                },
                onTap: () {
                  callback("");
                }));
  }

  static Widget imgSignature(
      BuildContext context, SignatureController controller) {
    return Container(
        margin: const EdgeInsets.all(16),
        child: DottedBorder(
          dashPattern: const [8, 4],
          strokeWidth: 2,
          color: Colors.grey,
          child: Signature(
            controller: controller,
            width: 200,
            height: 400,
            backgroundColor: Colors.white,
          ),
        ));
  }
}
