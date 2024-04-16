class Mahasiswa {
  String tglDaftar;
  String jenisPendaftaran;
  String nama;
  String NIM;
  String email;
  String judulTugasAkhir;
  String kategoriTugasAkhir;
  String calonDosenPembimbing1;
  String calonDosenPembimbing2;
  String berkas;
  String statusBerkas;
  String catatanUntukMahasiswa;

  Mahasiswa(
    {
      required this.tglDaftar,
      required this.jenisPendaftaran,
      required this.nama,
      required this.NIM,
      required this.email,
      required this.judulTugasAkhir,
      required this.kategoriTugasAkhir,
      required this.calonDosenPembimbing1,
      required this.calonDosenPembimbing2,
      required this.berkas,
      required this.statusBerkas,
      required this.catatanUntukMahasiswa
    }
  );

}