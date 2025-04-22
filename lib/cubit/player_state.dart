part of 'player_cubit.dart';

final List<Map<String, String>> allPlayers = [
  {'name': 'virat kohli', 'team': 'RCB', "country": "India"},
  {'name': 'rohit sharma', 'team': 'MI', "country": "India"},
  {'name': 'ab de villiers', 'team': 'RCB', "country": "South Africa"},
  {'name': 'sachin tendulkar', 'team': 'RCB', "country": "India"},
  {"name": "joe root", "team": "RCB", "country": "England"},
  {"name": "mohammad rizwan", "team": "RCB", "country": "Pakistan"},
  {"name": "Rinku singh", "team": "KKR", "country": "India"},
  {"name": "Kane Williamson", "team": "RCB", "country": "New Zealand"},
  {"name": "Andrew Russell", "team": "KKR", "country": "Australia"},
];

sealed class PlayerState {}

final class PlayerInitialState extends PlayerState {
  final List<Map<String, String>> player;
  PlayerInitialState(this.player);
}

final class PlayerFilteredState extends PlayerState {
  final List<Map<String, String>> filteredPlayer;
  PlayerFilteredState(this.filteredPlayer);
}
