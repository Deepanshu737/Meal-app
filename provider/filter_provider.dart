import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meal_app/provider/meal_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });
      /*void setFilters(Map<Filter,bool> chossenFilter ){
        state=chossenFilter;
      }*/
  void setFilter(Filter value, bool isActive) {
    state = {...state, value: isActive};
  }
}

final filter = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref) => FilterNotifier(),
);

final filteredMeal= Provider(
  (ref){
   final currentFilter= ref.watch(filter);
   final meal_1= ref.watch(mealProvider);
    return meal_1.where((meals) {
      if (currentFilter[Filter.glutenFree]! && !meals.isGlutenFree) {
        return false;
      }
      if (currentFilter[Filter.lactoseFree]! && !meals.isLactoseFree) {
        return false;
      }
      if (currentFilter[Filter.vegetarian]! && !meals.isVegetarian) {
        return false;
      }
      if (currentFilter[Filter.vegan]! && !meals.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }
);