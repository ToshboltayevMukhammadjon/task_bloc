import 'package:task_bloc/model/quote.dart';
import 'package:task_bloc/model/user.dart';
import 'package:task_bloc/service/user_service.dart';

class Repository {
  final Services charactersServices;

  Repository(this.charactersServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await charactersServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }
}