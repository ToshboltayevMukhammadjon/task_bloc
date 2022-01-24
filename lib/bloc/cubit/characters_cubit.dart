import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_bloc/model/quote.dart';
import 'package:task_bloc/model/user.dart';
import 'package:task_bloc/repository/repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final Repository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
