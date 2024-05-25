import 'package:flutter_bloc/flutter_bloc.dart';

import 'achievement.dart';

class AchievementController extends Cubit<List<Achievement>> {
  AchievementController(super.initialState);

  void add(Achievement achievement) {
    super.state.add(achievement);
    emit(state);
  }

  void remove(int index) {
    super.state.removeAt(index);
    emit(state);
  }
}
