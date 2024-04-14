import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar() {
  return AppBar(
    leading: Row(

      children: [

        Container(
          width: 4.0,
        ),

        IconButton(

          onPressed: () {
            print("menu bar pressed");
          },

          padding: EdgeInsets.fromLTRB(0.0, 1.5, 0.0, 0.0),

          icon: SvgPicture.asset(
            'assets/svgs/menu-icon.svg',
            width: 25.0,
            height: 15.0,
          ),
        ),

        Container(
          width: 3.0,
        ),

        Text(
          'SIPTATIF',
            style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        letterSpacing: -0.8,
                      ),
        )
      ],
    ),

    leadingWidth: 180,

    actions: [
      Icon(
        Icons.account_circle_rounded,
        size: 40,
        color: Colors.grey[850],
      ),

      Container(
        width: 8.0,
      ),

    ],

  shape: const Border(
      bottom: BorderSide(
          color: Colors.black,
          width: 1.0
      ),
    ),

    backgroundColor: Colors.grey[350],
  );
}
