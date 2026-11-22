import 'package:flutter/material.dart';
import 'package:meal_app/models/meals_blueprint.dart';
import 'package:meal_app/screen/in_meal.dart';
import 'package:meal_app/widgets/meal_items.dart';
//import 'package:meals_app/data/dummy_data.dart';

class MealScreen extends StatelessWidget {
  const MealScreen( this.meals,/*this.ifTapped,*/{this.title,super.key});
  final String? title;
  final List<Meals> meals;
  //final void Function(Meals meal) ifTapped;//repetation step of in_meal.dart just for the tabs screen.
  void thirdScreen(BuildContext context, Meals meal) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => InMealScreen(meal/*,(meal){
      ifTapped(meal);
    }*/)));
  }

  @override
  Widget build(ctx) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'None Meal Found!',

            style: Theme.of(ctx).textTheme.headlineMedium!.copyWith(
              color: Theme.of(ctx).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Try Something else',
            style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
              color: Theme.of(ctx).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItems(meals[index], (meal){
          thirdScreen(context, meal);
        }),
      );
    }
    if(title==null){
   return content;
    }
    return  Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
