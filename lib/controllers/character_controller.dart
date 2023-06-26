import 'dart:convert';

import 'package:refcoins_app/core/utils.dart';
import 'package:refcoins_app/models/character.dart';
import "package:http/http.dart" as http;

class CharacterController {
  Future<Character> getCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/character/3'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Character.fromJson(jsonData);
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
