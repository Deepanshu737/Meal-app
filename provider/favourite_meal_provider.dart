import 'package:flutter_riverpod/legacy.dart';
import 'package:meal_app/models/meals_blueprint.dart';

class FavouriteNotifier extends StateNotifier<List<Meals>> {
  FavouriteNotifier() : super([]);

  bool favouriteMealStatus(Meals meal) {
    final isFavourite = state.contains(meal);
    if (isFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMeal = StateNotifierProvider<FavouriteNotifier, List<Meals>>((
  ref,
) {
  return FavouriteNotifier();
});
