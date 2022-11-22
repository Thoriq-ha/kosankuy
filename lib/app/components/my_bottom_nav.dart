import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kosankuy/app/components/my_color.dart';

class MyBottomNavComponent {
  static BottomNavigationBar build(BuildContext context, Function onItemTapped,
      {required List<BottomNavigationBarItem> listItems,
      required int currentIndex}) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      selectedItemColor: MyColor.hexToColor(MyColor.greenYoung),
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 11,
        fontWeight: FontWeight.normal,
      ),
      elevation: 0,
      onTap: (value) {
        onItemTapped(value);
      },
      items: listItems,
      currentIndex: currentIndex,
    );
  }
}
