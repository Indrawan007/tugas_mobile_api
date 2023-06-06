import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos/'),
  );

  final data = json.decode(response.body);

  // final Map<String, dynamic> data = json.decode(response.body);
  print(data);
  // if (response.statusCode == 200) {
  //   final Map<String, dynamic> data = json.decode(response.body);
  //   print(data);
  //   return AllChapters.fromJson(data);
  // } else {
  //   throw Exception('Failed to fetch comic chapters');
  // }
}
