import 'package:filter_listview_cubit/cubit/image_picker_cubit.dart';
import 'package:filter_listview_cubit/cubit/internet_cubit.dart';
import 'package:filter_listview_cubit/cubit/navigation_cubit.dart';
import 'package:filter_listview_cubit/cubit/person_cubit.dart';
import 'package:filter_listview_cubit/cubit/player_cubit.dart';
import 'package:filter_listview_cubit/cubit/theme_cubit.dart';
import 'package:filter_listview_cubit/views/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PlayerCubit()),
        BlocProvider(create: (contex) => PersonCubit()),
        BlocProvider(create: (contex) => InternetCubit()),
        BlocProvider(create: (contex) => ImagePickerCubit()),
        BlocProvider(create: (contex) => ThemeCubit()..initialThme()),
        BlocProvider(create: (context) => NavigationCubit()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          debugShowCheckedModeBanner: false,
          home: NavigationView(),
        );
      },
    );
  }
}
