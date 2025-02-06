import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alquran/services/models/surat.dart';

class ApiService {
  static const String _baseUrl = 'https://quran-api.santrikoding.com/api/surah';

  static Future<List<Surat>> fetchSurah() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Surat.fromJson(json)).toList();
      } else {
        throw Exception('Gagal mengambil data, status: ${response.statusCode}');
      }
    } catch (e) {
      print("Error saat fetchSurah: $e");
      throw Exception('Terjadi kesalahan saat mengambil data');
    }
  }

  static Future<List<dynamic>> fetchAyat(int surahNumber) async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/$surahNumber"));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['ayat']; // Pastikan key 'ayat' sesuai dengan respons API
      } else {
        throw Exception('Gagal mengambil ayat, status: ${response.statusCode}');
      }
    } catch (e) {
      print("Error saat fetchAyat: $e");
      throw Exception('Terjadi kesalahan saat mengambil ayat');
    }
  }
}
