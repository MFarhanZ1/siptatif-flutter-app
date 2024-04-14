import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar() {
  return AppBar(

    title: Row(
      children: [
        IconButton(
          padding: EdgeInsets.fromLTRB(0.0, 1.5, 0.0, 0.0),
          onPressed: () {
            print("menu bar pressed");
          },
          icon: SvgPicture.asset(
            'assets/svgs/menu-icon.svg',
          ),
        ),
        Container(
          width: 10.0,
        ),
        Text(
          'SIPTATIF',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            letterSpacing: -0.8,
          ),
        ),

        const Spacer(),

        const Icon(
          Icons.account_circle_rounded,
          size: 45,
        )
      ],
    ),

    shape: const Border(
      bottom: BorderSide(
          color: Colors.black,
          width: 1.0
      ),
    ),

    backgroundColor: Colors.grey[350],

  );
}
