import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:siptatif_app/datas/models/mahasiswa.dart';
import 'package:siptatif_app/datas/models/penguji.dart';

class PengujiIUScreen extends StatefulWidget {
  const PengujiIUScreen({super.key});

  @override
  State<PengujiIUScreen> createState() => _PengujiIUScreenState();
}

class _PengujiIUScreenState extends State<PengujiIUScreen> {

  bool value = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Penguji;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Berkas Mahasiswa",),
              Tab(text: "Input Dos. Penguji",),
            ],
          ),
          title: const Text('Detail Pengajuan Mhs'),
          titleSpacing: 0,
        ),
        body: TabBarView(
          children: [
            contentDetail(args),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
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
