import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems(this.onPress,{super.key});
  final void Function(String value) onPress;
  @override
  Widget build(ctx) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(ctx).colorScheme.secondary,
                  Theme.of(ctx).colorScheme.onPrimary,
                ],
                end: AlignmentGeometry.bottomStart,
                begin: AlignmentGeometry.topEnd,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood_rounded),
                SizedBox(width: 15),
                Text(
                  'Cooking Up!',
                  style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                    color: Theme.of(ctx).colorScheme.onSurface,fontWeight: FontWeight.bold,fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
          ListTile(  //ALTERNATIVE TO ROW()
            onTap: () {
              onPress('meals');
            },
            leading: Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.onSurface,fontSize: 25,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              onPress('filter');
            },
            leading: Icon(Icons.filter_alt),
            title: Text(
              'Filter',
              style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.onSurface,fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
