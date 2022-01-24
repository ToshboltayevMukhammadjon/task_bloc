import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bloc/repository/repository.dart';
import 'package:task_bloc/service/user_service.dart';
import 'package:task_bloc/ui/home/details/screen.dart';
import 'package:task_bloc/ui/home/home_page.dart';
import 'bloc/cubit/characters_cubit.dart';
import 'core/constants/constants.dart';
import 'model/user.dart';

class AppRouter {
  late Repository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = Repository(Services());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
    return null;
  }
}
