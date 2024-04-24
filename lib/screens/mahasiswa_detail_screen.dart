import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:siptatif_app/datas/models/mahasiswa.dart';
import 'package:siptatif_app/datas/models/penguji.dart';
import 'package:siptatif_app/datas/penguji_data.dart';

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
            inputPenguji(),
          ],
        ),
      ),
    );
  }

  Widget _textFieldGenerator(String label) {
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
  
  Widget inputPenguji(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          Container(
            child: TextField(
              style: TextStyle(
                  height: 1
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Search',
              ),
            ),
          ),


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: pengujiData.map((penguji) => _templatePengujiCard(penguji)).toList(),
            ),
          ),

          SizedBox(
            height: 23,
          ),
          
          _textFieldGenerator("Input Dosen Penguji 1"),
          _textFieldGenerator("Input Dosen Penguji 2"),

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

  Card _templatePengujiCard(Penguji penguji){
    return Card(
        elevation: 0,
        color: Colors.grey[200],
        margin: const EdgeInsets.fromLTRB(0,18, 17, 0),
        child:

        Padding(

          padding: const EdgeInsets.all(12.0),

          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _generateRowDataPoint(Icons.account_circle_rounded, penguji.nama),
              _generateRowDataPoint(Icons.calendar_view_day_rounded, penguji.NIDN),
              _generateRowDataPoint(Icons.transgender_rounded, penguji.jenisKelamin),

              SizedBox(
                height: 4,
              ),

              Divider(
                height: 1,
                color: Colors.black,
                thickness: 0.8,
              ),

              SizedBox(
                height: 4,
              ),

              Text('"${penguji.keahlian}"', textAlign: TextAlign.start,),
              SizedBox(
                height: 4,
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber[200]
                ),
                child: Text(
                  "${penguji.kuota.toString()} kuota tersedia",
                  style: TextStyle(
                    fontFamily: "Montserrat-SemiBold",
                    letterSpacing: -0.5,
                  ),
                ),
              )

            ],
          ),
        )
    );
  }

  Row _generateRowDataPoint(IconData icon, String label){
    return Row(
      children: [
        Icon(icon, size: 15,),
        SizedBox(
          width: 3,
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.3,
          ),
        )
      ],
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
          child: TextFormField(
            initialValue: val,
            style: TextStyle(
                height: 1
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

      ],
    );
  }


}
