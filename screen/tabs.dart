import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favourite_meal_provider.dart';
//import 'package:meal_app/provider/meal_provider.dart';
//import 'package:meal_app/models/meals_blueprint.dart';
import 'package:meal_app/screen/categories.dart';
import 'package:meal_app/screen/filters.dart';
import 'package:meal_app/screen/meal.dart';
import 'package:meal_app/widgets/drawer_items.dart';
import 'package:meal_app/provider/filter_provider.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int pageCount = 0;
  //final List<Meals> _favoriteList = [];

  //Map<Filter,bool> _selectedFilter = kInitialFilter;

  /*void mealStatus(Meals meal) {
    final isExisting = _favoriteList.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteList.remove(meal);
        message('Favorite Meal Removed');
      });
    } else {
      setState(() {
        _favoriteList.add(meal);
        message('Meal Added to Favorite');
      });
    }
  }*/

  void currentPage(int index) {
    setState(() {
      pageCount = index;
    });
  }

  /*void message(String message) {
    //ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: TextStyle(fontSize: 20))),
    );
  }
*/
  void onScreen(String value) async {
    Navigator.of(context).pop();
    if (value == 'filter') {
      /*final result = */
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(),
        ), //_selectedFilter)),
      );
      // setState(() {
      //    _selectedFilter=result??kInitialFilter;
      //   },);
    }
  }

  @override
  Widget build(ctx) {
  //  final meal_1 = ref.watch(mealProvider);
   //   final currentFilter = ref.watch(filter);
    final meal = ref.watch(filteredMeal); /*meal_1.where((meals) {
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
    }).toList();*/
    Widget currentScreen = CategoriesScreen(/*mealStatus,*/ meal);
    var currentTitle = 'Category';
    if (pageCount == 1) {
      final fMeal = ref.watch(favouriteMeal);
      currentScreen = MealScreen(fMeal /*, mealStatus*/);
      currentTitle = 'Favorite';
    }

    return Scaffold(
      drawer: DrawerItems(onScreen),
      appBar: AppBar(title: Text(currentTitle)),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: currentPage,
        currentIndex: pageCount,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
