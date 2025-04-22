import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationInitialState> {
  NavigationCubit() : super(NavigationInitialState(seletedIndex: 0));

  void changeTab(int selectedIndex) =>
      emit(NavigationInitialState(seletedIndex: selectedIndex));
}
