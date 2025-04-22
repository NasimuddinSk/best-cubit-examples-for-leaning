import 'package:filter_listview_cubit/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation")),
      body: BlocBuilder<NavigationCubit, NavigationInitialState>(
        builder: (context, state) {
          return Center(
            child:
                state.seletedIndex == 0
                    ? Text("Home")
                    : state.seletedIndex == 1
                    ? Text("Wishlist")
                    : Text("Profile"),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationInitialState>(
        builder: (context, state) {
          return NavigationBar(
            animationDuration: Duration(milliseconds: 700),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_rounded),
                label: "Home",
                selectedIcon: Icon(Icons.home),
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: "Wishlist",
                selectedIcon: Icon(Icons.favorite),
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: "Profile",
                selectedIcon: Icon(Icons.person),
              ),
            ],
            selectedIndex: state.seletedIndex,
            onDestinationSelected:
                (value) => context.read<NavigationCubit>().changeTab(value),
          );
        },
      ),
    );
  }
}
