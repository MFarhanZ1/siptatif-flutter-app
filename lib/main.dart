import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:siptatif_app/screens/login_screen.dart';
import 'package:siptatif_app/screens/lupa_password_screen.dart';
import 'package:siptatif_app/screens/main_screen.dart';
import 'package:siptatif_app/screens/register_screen.dart';
import 'package:siptatif_app/screens/reset_password.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatefulWidget {

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/lupa-password": (context) => LupaPasswordScreen(),
        "/reset-password": (context) => ResetPassword(),
        "/main": (context) => MainScreen(),
      },

      title: "SIPTATIF Mobile",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),

      home: MainScreen(),
    );

  }

}
