// ignore_for_file: file_names call api ผ่าน network
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'TEMPmodel.dart';

class TempService {
  static Future<TEMPmodel> convertTemperature(double temperature, String unit) async {
    var parameters = 'temperature=$temperature&unit=$unit';
    var api = 'http://localhost/temperature_api/temp.php'; // ปรับ URL ตามที่ตั้งค่า
    var url = Uri.parse('$api?$parameters');

    var response = await http.get(url);

    // แปลง JSON จากการตอบกลับเป็น TEMPmodel
    return TEMPmodel.fromJson(json.decode(response.body));
  }
}
