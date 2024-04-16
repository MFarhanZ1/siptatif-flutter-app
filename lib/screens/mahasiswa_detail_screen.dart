import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:siptatif_app/datas/models/mahasiswa.dart';

class MahasiswaDetailScreen extends StatefulWidget {
  const MahasiswaDetailScreen({super.key});

  @override
  State<MahasiswaDetailScreen> createState() => _MahasiswaDetailScreenState();
}

class _MahasiswaDetailScreenState extends State<MahasiswaDetailScreen> {

  bool value = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Mahasiswa;
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



  Widget contentDetail(Mahasiswa mhs) {

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(

        children: [
            _contentInput("Jenis Pendaftaran", mhs.jenisPendaftaran),
            _contentInput("Nama Mahasiswa", mhs.nama),
            _contentInput("NIM Mahasiswa", mhs.NIM),
            _contentInput("Email Mahasiswa", mhs.email),
            _contentInput("Judul Tugas Akhir", mhs.judulTugasAkhir),
            _contentInput("Kategori TA", mhs.kategoriTugasAkhir),
            _contentInput("Calon Dosen Pembimbing 1", mhs.calonDosenPembimbing1),
            _contentInput("Calon Dosen Pembimbing 2", mhs.calonDosenPembimbing2),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Berkas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.5),),
                  const SizedBox(height: 5),
                  Container(
                    width: 320,
                    height: 115,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        Text("Buka Berkas"),
                        IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.upload_file_rounded,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                ],
              ),
            ),


          SizedBox(
            width: 320,
              child: Text("Status Berkas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.5),)
          ),

          Row(
            children: [
              Checkbox(
                value: this.value,
                onChanged: (bool? value) {

                  setState(() {
                    this.value = value ?? true;
                    this.value2 = !this.value;
                  });

                },
              ),
              Text("Diterima"),


              Checkbox(
                value: this.value2,
                onChanged: (bool? value) {

                  setState(() {
                    this.value2 = value ?? true;
                    this.value = !this.value2;
                  });

                },
              ),
              Text("Ditolak"),
            ],
          ),

            SizedBox(height: 10,),
            _contentInput("Catatan Untuk Mahasiswa", mhs.catatanUntukMahasiswa),

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
