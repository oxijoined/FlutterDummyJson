import 'dart:convert';

import 'package:flutter_practice/models/product.dart';
import 'package:http/http.dart' as http;

class DummyJsonService {
  static Future<List<Product>> getProducts() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> productsJson = json.decode(response.body)['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<bool> authenticate(String username, String password) async {
    var url = Uri.parse('https://dummyjson.com/auth/login');
    var response = await http.post(url, body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      return true; // Успешная аутентификация
    } else {
      return false; // Аутентификация не удалась
    }
  }
}
