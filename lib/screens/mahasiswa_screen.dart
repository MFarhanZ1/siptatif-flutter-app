import 'package:flutter/material.dart';

class MahasiswaScreen extends StatefulWidget {
  const MahasiswaScreen({super.key});

  @override
  State<MahasiswaScreen> createState() => _MahasiswaScreenState();
}

class _MahasiswaScreenState extends State<MahasiswaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('mahasiswa'),
    );
  }
}
