import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/products_model.dart';
import 'auth_local_datasource.dart';

class ProductRemoteDatasource {
  Future<List<Products>> getProducts() async {
    final token = await AuthLocalDatasource().getToken();
    final response = await http.get(
      Uri.parse('https://tiket.hanssu.my.id/api/all-products'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final data = body['data'];
      return data.map<Products>((json) => Products.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
