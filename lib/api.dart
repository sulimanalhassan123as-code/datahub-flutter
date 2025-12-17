import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://never-hide17-dt3m.onrender.com';

  // REGISTER
  static Future<bool> register(String phone, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phone': phone,
        'password': password,
      }),
    );

    return response.statusCode == 200;
  }

  // GET BUNDLES
  static Future<Map<String, dynamic>> getBundles() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/bundles'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load bundles');
    }

    return jsonDecode(response.body);
  }

  // BUY BUNDLE ✅ (THIS WAS MISSING)
  static Future<String> buyBundle({
    required String network,
    required String bundleId,
    required String phone,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/buy-bundle'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'network': network,
        'bundle_id': bundleId,
        'phone': phone,
      }),
    );

    if (response.statusCode == 200) {
      return 'Success';
    } else {
      final data = jsonDecode(response.body);
      return data['detail'] ?? 'Failed';
    }
  }
}
