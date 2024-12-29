import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
