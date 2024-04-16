import 'package:flutter/material.dart';
import 'package:siptatif_app/datas/mahasiswa_data.dart';
import 'package:siptatif_app/datas/models/mahasiswa.dart';

class MahasiswaScreen extends StatefulWidget {
  const MahasiswaScreen({super.key});

  @override
  State<MahasiswaScreen> createState() => _MahasiswaScreenState();
}

class _MahasiswaScreenState extends State<MahasiswaScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: Column(
        children: [

          const SizedBox(
            height: 3,
          ),

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

          const SizedBox(
            height: 3,
          ),

          Column(
            children: mahasiswaData.map((mhs) => _templateMhsCard(mhs)).toList(),
          ),

          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }

  Color? _warnaStatusCard (String status, {int shade = 50}){
    if (status == "Disetujui") {
      return Colors.green[shade];
    } else if (status == "Ditolak") {
      return Colors.red[shade];
    }
    return Colors.amber[shade];
  }
  
  Card _templateMhsCard(Mahasiswa mhs){
    return Card(
        elevation: 0,
        color: _warnaStatusCard(mhs.statusBerkas),
        margin: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
        child:

        Padding(

          padding: const EdgeInsets.all(12.0),

          child:
          Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _generateRowDataPoint(Icons.calendar_month_rounded, mhs.tglDaftar),
                  _generateRowDataPoint(Icons.account_circle_rounded, mhs.nama),
                  _generateRowDataPoint(Icons.calendar_view_day_rounded, mhs.NIM),
                  _generateRowDataPoint(Icons.email_rounded, mhs.email),

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
                  Text('"${mhs.judulTugasAkhir}"', textAlign: TextAlign.start,),
                  SizedBox(
                    height: 4,
                  ),

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _warnaStatusCard(mhs.statusBerkas, shade: 200),
                        ),
                        child: Text(
                            mhs.statusBerkas,
                            style: TextStyle(
                              fontFamily: "Montserrat-SemiBold",
                              letterSpacing: -0.5,
                            ),
                        ),
                      ),
                      const Spacer(),
                      IconButton.filledTonal(
                          onPressed: () {

                          },
                          icon: Icon(Icons.edit_note_outlined),
                      ),
                      IconButton.filled(
                          onPressed: (){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text('Apakah anda yakin ingin menghapus data pengajuan mahasiswa ini?'),
                                    const SizedBox(height: 15),

                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.amber[100],
                                          ),
                                          child: const Text('Batalkan', style: TextStyle(color: Colors.black, letterSpacing: -0.2),)
                                      ),
                                    ),

                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.red[100],
                                          ),
                                          child: const Text('Iya, Saya Yakin', style: TextStyle(color: Colors.black, letterSpacing: -0.2),)
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                          // onPressed: () {
                              // AwesomeDialog(
                              //   context: context,
                              //   dialogType: DialogType.warning,
                              //   title: "Data Removed Warning!",
                              //   desc: "Apakah anda yakin ingin menghapus data pengajuan mahasiswa ini?"
                              // ).show();
                          // },
                          icon: Icon(Icons.delete_outline_sharp),
                      )
                    ],
                  )

                ],
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


}
