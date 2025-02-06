import 'package:flutter/material.dart';
import 'package:alquran/services/models/surat.dart';

class DetailPage extends StatelessWidget {
  final Surat surat;

  DetailPage({required this.surat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surat.namaLatin),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                surat.namaArab,
                style: TextStyle(fontSize: 36, fontFamily: 'Amiri', fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Jumlah Ayat: ${surat.jumlahAyat}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            SizedBox(height: 15),
            Text(
              "Deskripsi:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              surat.deskripsi,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}