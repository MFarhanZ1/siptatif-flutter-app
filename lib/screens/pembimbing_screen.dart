import 'package:flutter/material.dart';
import 'package:siptatif_app/datas/models/pembimbing.dart';
import 'package:siptatif_app/datas/models/pembimbing.dart';
import 'package:siptatif_app/datas/pembimbing_data.dart';
import 'package:siptatif_app/datas/penguji_data.dart';

class PembimbingScreen extends StatefulWidget {
  const PembimbingScreen({super.key});

  @override
  State<PembimbingScreen> createState() => _PembimbingScreenState();
}

class _PembimbingScreenState extends State<PembimbingScreen> {

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
            height: 14,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/tambah-pembimbing");
                  },
                  child: Text("+ Tambah Data")
              ),
            ],
          ),

          Column(
            children: pembimbingData.map((pembimbing) => _templatePembimbingCard(pembimbing)).toList(),
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

  Card _templatePembimbingCard(Pembimbing pembimbing){
    return Card(
        elevation: 0,
        color: Colors.grey[200],
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
                  _generateRowDataPoint(Icons.account_circle_rounded, pembimbing.nama),
                  _generateRowDataPoint(Icons.calendar_view_day_rounded, pembimbing.NIDN),
                  _generateRowDataPoint(Icons.transgender_rounded, pembimbing.jenisKelamin),

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
                  Text('"${pembimbing.keahlian}"', textAlign: TextAlign.start,),
                  SizedBox(
                    height: 4,
                  ),

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.amber[200]
                        ),
                        child: Text(
                          "${pembimbing.kuota.toString()} kuota tersedia",
                          style: TextStyle(
                            fontFamily: "Montserrat-SemiBold",
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton.filledTonal(
                        onPressed: () {
                          Navigator.pushNamed(context, "/pembimbing-update-screen", arguments: pembimbing);
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
