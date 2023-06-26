import 'package:flutter/foundation.dart';
import 'package:refcoins_app/controllers/character_controller.dart';
import 'package:refcoins_app/models/character.dart';

class CharacterProvider extends ChangeNotifier {
  Character? _characters;
  Character? get characters => _characters;

  final CharacterController _api = CharacterController();

  Future<void> fetchCharacters() async {
    try {
      _characters = await _api.getCharacters();
      notifyListeners();
    } catch (e) {
      print('Failed to fetch characters: $e');
    }
  }
}
