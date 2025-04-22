import 'package:filter_listview_cubit/cubit/player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTextEditingController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Home View')),
      body: Column(
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              controller: searchTextEditingController,
              onChanged: (value) {
                context.read<PlayerCubit>().filteredPlayer(value);
              },
              decoration: InputDecoration(
                label: Text(
                  "Search",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<PlayerCubit, PlayerState>(
              builder: (contex, state) {
                if (state is PlayerInitialState) {
                  return buildFilteredList(state.player);
                } else if (state is PlayerFilteredState) {
                  return buildFilteredList(state.filteredPlayer);
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilteredList(List<Map<String, String>> players) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3),
          child: Card(
            child: ListTile(
              title: Text(player["name"] ?? ""),
              subtitle: Text(player["country"] ?? ""),
              trailing: Text(player["team"] ?? ""),
            ),
          ),
        );
      },
    );
  }
}
