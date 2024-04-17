import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:siptatif_app/datas/models/penguji.dart';

class PengujiUpdateScreen extends StatefulWidget {
  const PengujiUpdateScreen({super.key});

  @override
  State<PengujiUpdateScreen> createState() => _PengujiUpdateScreenState();
}

class _PengujiUpdateScreenState extends State<PengujiUpdateScreen> {

  bool value = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Penguji;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data Penguji'),
        titleSpacing: 0,
      ),
      body: contentDetail(args),
    );
  }

  Widget contentDetail(Penguji penguji) {

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(

        children: [
          _contentInput("Nama Dosen", penguji.nama),
          _contentInput("NIDN Dosen", penguji.NIDN),
          _contentInput("Jenis Kelamin Dosen", penguji.jenisKelamin),
          _contentInput("Kuota Mahasiswa Bimbingan", penguji.kuota.toString()),
          _contentInput("Keahlian Dosen", penguji.keahlian),

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

  Widget _contentInput(String label, String val) {
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
              hintText: val,
            ),
          ),
        ),

        const SizedBox(height: 20),

      ],
    );
  }


}
