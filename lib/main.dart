import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siptatif_app/screens/home_screen.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "SIPTATIF",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),

    );
  }
}
