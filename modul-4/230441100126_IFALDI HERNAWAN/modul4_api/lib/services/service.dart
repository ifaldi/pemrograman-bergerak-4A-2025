import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class MotorService {
  static const String baseUrl = "https://cobabroo-dd095-default-rtdb.firebaseio.com/motor";

  // GET
  static Future<List<MapEntry<String, Motor>>> fetchMotor() async {
    final response = await http.get(Uri.parse("$baseUrl.json"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return data.entries.map((e) => MapEntry(e.key, Motor.fromJson(e.value))).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // POST (Create)
  static Future<void> addMotor(Motor motor) async {
    final response = await http.post(
      Uri.parse("$baseUrl.json"),
      body: json.encode(motor.toJson()),
    );
    if (response.statusCode != 200) throw Exception("Gagal menambahkan motor");
  }

  // PUT (Update)
  static Future<void> updateMotor(String id, Motor motor) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id.json"),
      body: json.encode(motor.toJson()),
    );
    if (response.statusCode != 200) throw Exception("Gagal mengupdate motor");
  }

  // DELETE
  static Future<void> deleteMotor(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id.json"));
    if (response.statusCode != 200) throw Exception("Gagal menghapus motor");
  }
}
