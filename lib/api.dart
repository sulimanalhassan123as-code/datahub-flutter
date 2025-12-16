import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class ApiService {
  static Future<Map<String, dynamic>> register(String phone, String password) async {
    final res = await http.post(
      Uri.parse("$API_URL/api/v1/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone, "password": password}),
    );
    return jsonDecode(res.body);
  }

  static Future<List> getBundles() async {
    final res = await http.get(Uri.parse("$API_URL/api/v1/bundles"));
    return jsonDecode(res.body);
  }

  static Future<Map<String, dynamic>> buyBundle(
      String network, String bundleId, String phone) async {
    final res = await http.post(
      Uri.parse("$API_URL/api/v1/buy-bundle"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "network": network,
        "bundle_id": bundleId,
        "phone": phone
      }),
    );
    return jsonDecode(res.body);
  }

  static Future<Map<String, dynamic>> topUp(String phone, int amount) async {
    final res = await http.post(
      Uri.parse("$API_URL/api/v1/wallet/topup"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone, "amount": amount}),
    );
    return jsonDecode(res.body);
  }
}
