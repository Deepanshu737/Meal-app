import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category_blueprint.dart';
import 'package:meal_app/models/meals_blueprint.dart';
import 'package:meal_app/screen/meal.dart';
import 'package:meal_app/widgets/grid_items.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(/*this.ifTapped,*/ this.meal, {super.key});
  //final void Function(Meals meal) ifTapped;
  final List<Meals> meal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: Duration(seconds: 1),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose(); //should be at last.
  }

  void secondScreen(BuildContext ctx, Category category) {
    final ifCategoryIs = widget.meal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          ifCategoryIs /*,(meal){
          ifTapped(meal);}*/,
        ),
      ),
    ); // its smae as Navigator.push(ctx,route)
  }

  @override
  Widget build(ctx) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            // using for and in there is an alternative to availableCategories.map((category) => GridItem(category);
            GridItems(category, () {
              secondScreen(ctx, category);
            }),
        ],
      ),
      builder: (ctx, child) => SlideTransition(
        position: Tween(begin: Offset(0, 0.2), end: Offset(0, 0)).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Easing.standardAccelerate,
          ),
        ),
        child: child,
      ),
    );
  }
}
