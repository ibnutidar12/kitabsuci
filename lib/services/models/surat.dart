class Surat {
  final int nomor;
  final String namaLatin;
  final String namaArab;
  final int jumlahAyat;
  final String deskripsi;

  Surat({
    required this.nomor,
    required this.namaLatin,
    required this.namaArab,
    required this.jumlahAyat,
    required this.deskripsi,
  });

  factory Surat.fromJson(Map<String, dynamic> json) {
    return Surat(
      nomor: json['nomor'],
      namaLatin: json['nama_latin'],
      namaArab: json['nama'],
      jumlahAyat: json['jumlah_ayat'],
      deskripsi: json['deskripsi'] ?? "Deskripsi tidak tersedia",
    );
  }
}