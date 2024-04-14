import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavigationBar bottomNavigationBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.grey[350],
    // showSelectedLabels: false,
    // showUnselectedLabels: false,
    items: [
      _bottomBarItem(
          icon: "assets/svgs/beranda-icon.svg", label: "Beranda"),
      _bottomBarItem(
          icon: "assets/svgs/mahasiswa-icon.svg", label: "Mahasiswa"),
      _bottomBarItem(
          icon: "assets/svgs/penguji-icon.svg", label: "Penguji"),
      _bottomBarItem(
          icon: "assets/svgs/pembimbing-icon.svg", label: "Pembimbing"),
    ],
    unselectedLabelStyle: TextStyle(
      fontSize: 12.0,
      color: Colors.black,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.6,
    ),
    selectedLabelStyle: TextStyle(
      fontSize: 12.0,
      color: Colors.black,
      fontWeight: FontWeight.w800,
      letterSpacing: -1.0,
    ),

    useLegacyColorScheme: false,
  );
}

BottomNavigationBarItem _bottomBarItem(
    {required String icon, required String label}
    ) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      icon,
      width: 45.0,
      height: 45.0,
    ),
    activeIcon: Container(
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey[200]
      ),
      child: SvgPicture.asset(
        icon,
        width: 45.0,
        height: 45.0,
      ),
    ),
    label: label,
  );
}