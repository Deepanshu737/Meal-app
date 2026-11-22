import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favourite_meal_provider.dart';
import 'package:meal_app/models/meals_blueprint.dart';
//import 'package:meals_app/data/dummy_data.dart';

class InMealScreen extends ConsumerWidget {
  //StatelessWidget{
  const InMealScreen(this.mealInside /*this.ifTapped,*/, {super.key});
  final Meals mealInside;
  //final void Function(Meals meal) ifTapped;
  @override
  Widget build(ctx, WidgetRef ref) {
    final fMeals = ref.watch(favouriteMeal);
    final isFavourite = fMeals.contains(mealInside);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealInside.title),

        actions: [
          IconButton(
            onPressed: () {
              final wasMeal = ref
                  .read(favouriteMeal.notifier)
                  .favouriteMealStatus(mealInside);
              ScaffoldMessenger.of(ctx).clearSnackBars();
              ScaffoldMessenger.of(ctx).showSnackBar(
                SnackBar(
                  content: Text(
                    wasMeal
                        ? 'Meal Added to Favorite'
                        : 'Favorite Meal Removed',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: 0.9, end: 1).animate(animation),
                child: child,
              ), //or alternative to Tween<double> is make inside value all to decimal like 1-> 1.0
              child: Icon(
                isFavourite ? Icons.star_rate : Icons.star_border,
                key: ValueKey(isFavourite),
              ),
            ),
          ),
        ],
      ),
      body: Hero(
        tag:mealInside.id,
        child: ListView(
          children: [
            Image.network(
              mealInside.imageUrl,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              'Ingretidents',
              textAlign: TextAlign.center,
              style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.primary,
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            for (final ingredient in mealInside.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  ingredient,
                  textAlign: TextAlign.center,
                  style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(ctx).colorScheme.onSurface,
                    fontSize: 17,
                  ),
                ),
              ),
            SizedBox(height: 13),
            Text(
              'Steps',
              textAlign: TextAlign.center,
              style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.primary,
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
            for (final steps in mealInside.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(ctx).colorScheme.onSurface,
                    fontSize: 15,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
