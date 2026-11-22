import 'package:flutter/material.dart';
import 'package:meal_app/models/meals_blueprint.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meal_app/widgets/meal_item_items.dart';

class MealItems extends StatelessWidget {
  const MealItems(this.meal, this.onTapping,{super.key});
  final Meals meal;
  final void Function(Meals meal) onTapping;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabiltyText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }
 
  @override
  Widget build(ctx) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      clipBehavior: Clip.hardEdge,

      child: InkWell(
        onTap: (){
          onTapping(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 45),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItem(Icons.schedule, '${meal.duration} min'),
                        // uisng of ${} is an alternative to using of .toString() .Also using of $ gives us to write min also in front of it.
                        SizedBox(width: 10),
                        MealItem(Icons.all_inclusive_sharp, complexityText),
                        SizedBox(width: 10),
                        MealItem(Icons.monetization_on, affordabiltyText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
