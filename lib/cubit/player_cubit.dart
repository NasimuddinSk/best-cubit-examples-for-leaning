import 'package:flutter_bloc/flutter_bloc.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerInitialState(allPlayers));
  void filteredPlayer(String name) {
    if (name.isEmpty) {
      emit(PlayerInitialState(allPlayers));
    } else {
      final List<Map<String, String>> filteredList;
      filteredList =
          allPlayers
              .where(
                (player) => player["name"].toString().toLowerCase().contains(
                  name.toLowerCase(),
                ),
              )
              .toList();
      emit(PlayerFilteredState(filteredList));
    }
  }
}
