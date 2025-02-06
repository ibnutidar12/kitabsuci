import 'package:flutter/material.dart';
import 'package:alquran/services/models/surat.dart';
import '../services/api_service.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Surat>> surahList;

  @override
  void initState() {
    super.initState();
    surahList = ApiService.fetchSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al-Qur'an"),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder<List<Surat>>(
        future: surahList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("Error: ${snapshot.error}"); // Debugging error
            return Center(child: Text("Gagal memuat data."));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Tidak ada data tersedia."));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var surat = snapshot.data![index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pink,
                    child: Text(
                      "${surat.nomor}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        surat.namaLatin,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        surat.namaArab,
                        style: TextStyle(fontSize: 20, fontFamily: 'Amiri'),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  subtitle: Text("Jumlah Ayat: ${surat.jumlahAyat}"),
                  trailing: Text(
                    "${surat.jumlahAyat} Ayat",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(surat: surat),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
