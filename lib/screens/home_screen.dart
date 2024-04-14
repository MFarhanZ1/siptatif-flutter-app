import 'package:flutter/material.dart';
import 'package:siptatif_app/navigations/top_bar.dart';
import 'package:siptatif_app/navigations/bottom_bar.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: Text('Hello, World!...'),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}