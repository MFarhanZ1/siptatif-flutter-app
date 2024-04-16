import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BerandaObject {
  String nama;
  int terdaftar;
  int kuota;

  BerandaObject({required this.nama, required this.terdaftar, required this.kuota});
}

List<BerandaObject> berandaData = [
  BerandaObject(
    nama: "Mahasiswa",
    terdaftar: 24,
    kuota: 120,
  ),
  BerandaObject(
    nama: "Penguji",
    terdaftar: 37,
    kuota: 13,
  ),
  BerandaObject(
    nama: "Pembimbing",
    terdaftar: 42,
    kuota: 12,
  ),
];

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: berandaData.map((ret) => _templateBerandaMahasiswaCard(ret)).toList(),
      ),
    );
  }

  Card _templateBerandaMahasiswaCard(BerandaObject berandaData){
    return Card(

        elevation: 0,
        color: Colors.grey[300],
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
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
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    decoration: const BoxDecoration(
                      color: Colors.black
                    ),
                    child: Text(
                      berandaData.nama,
                      style:
                      const TextStyle(
                        fontFamily: "Montserrat-SemiBold",
                        fontSize: 23.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6.0),

              Row(

                children: [
                  SvgPicture.asset("assets/svgs/person-non-bg.svg",),

                  const SizedBox(width: 4,),

                  Text(
                    "${berandaData.terdaftar} ${berandaData.nama == 'Mahasiswa' ? 'orang mendaftar' : 'dosen terdaftar'} ",
                    style: const TextStyle(
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 27,
                      letterSpacing: -2,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ],

              ),

              const SizedBox(height: 4,),

              Row(
                children: [

                  Text(
                    "${berandaData.kuota} ${berandaData.nama == 'Mahasiswa' ? 'telah disetujui' : 'kuota masih tersedia'}.",
                    style:
                    const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      letterSpacing: -0.4,
                      fontWeight: FontWeight.w800
                    ),
                  ),

                  const SizedBox(width: 2,),

                  Icon(Icons.check_circle, size: 19,color: Colors.green.shade700,)

                ],
              ),

              const SizedBox(height: 4,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${berandaData.nama == 'Mahasiswa' ? '*data perbulan ini' : '*data keseluruhan'}", style: TextStyle(fontStyle: FontStyle.italic, letterSpacing: -0.7, fontSize: 14),),
                  const Spacer(),

                  InkWell(
                    onTap: () {
                    },
                    child: Row(
                      children: [
                        Text(
                          "cek list detail",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.purple
                          ),
                        ),
                        Icon(Icons.keyboard_double_arrow_right_rounded, color: Colors.purple,)
                      ],
                    ),
                  ),
                ],
              )

            ],
          ),
        )
    );
  }
}