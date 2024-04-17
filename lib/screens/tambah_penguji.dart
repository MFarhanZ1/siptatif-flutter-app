import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:siptatif_app/datas/models/penguji.dart';

class PengujiTambahScreen extends StatefulWidget {
  const PengujiTambahScreen({super.key});

  @override
  State<PengujiTambahScreen> createState() => _PengujiTambahScreenState();
}

class _PengujiTambahScreenState extends State<PengujiTambahScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Penguji'),
        titleSpacing: 0,
      ),
      body: contentDetail(),
    );
  }

  Widget contentDetail() {

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(

        children: [
          _contentInput("Nama Dosen"),
          _contentInput("NIDN Dosen"),
          _contentInput("Jenis Kelamin Dosen"),
          _contentInput("Kuota Mahasiswa Bimbingan"),
          _contentInput("Keahlian Dosen"),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, child: Text(
                  "Kembali"
              )
              ),

              const SizedBox(width: 8,),

              FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, child: Text(
                  "Kirim"
              )
              )
            ],
          )

        ],
      ),
    );
  }

  Widget _contentInput(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.5),),
        const SizedBox(height: 5),
        SizedBox(
          child: TextField(
            style: TextStyle(
                height: 1
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: label,
            ),
          ),
        ),

        const SizedBox(height: 20),

      ],
    );
  }


}
