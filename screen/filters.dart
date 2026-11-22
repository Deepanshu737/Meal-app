import 'package:flutter/material.dart';
import 'package:meal_app/provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  //ConsumerStatefulWidget {
  const FiltersScreen({super.key}); //this.currentFilter,{super.key});
  //final Map<Filter,bool> currentFilter;
  /*@override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}
class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var isGlutenFree =
      false; // variable ko dekhna vo @override ya fhir Widget build(ctx) ke uppar he ho vrna kya pta kuch unexpected ho jaaye jo error mai bhi na dikha jaise abhi ho gya tha
  var isLactoseFree = false;
  var isVegetarian = false;
  var isVegan = false;
  @override
  void initState() {
    super.initState();
    final activeFilter = ref.read(filter);
    isGlutenFree = activeFilter[Filter.glutenFree]!;
    isLactoseFree = activeFilter[Filter.lactoseFree]!;
    isVegetarian = activeFilter[Filter.vegetarian]!;
    isVegan = activeFilter[Filter.vegan]!;
  }
*/
  @override
  Widget build(ctx, WidgetRef ref) {
    final activeFilter = ref.watch(filter);
    return Scaffold(
      appBar: AppBar(title: Text('Your\'s Filtered Meal')),
      body: /*PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          ref.read(filter.notifier).setFilters({
           Filter.glutenFree: isGlutenFree,
            Filter.lactoseFree: isLactoseFree,
            Filter.vegetarian: isVegetarian,
            Filter.vegan: isVegan,
             },);
          if (didPop) return;
        //  Navigator.of(context).pop();
        },
        child:*/ Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.glutenFree]!, //isGlutenFree,
            onChanged: (ifGlutenFree) {
              /*  setState(() {
                  isGlutenFree = ifGlutenFree;
                });*/
              ref
                  .read(filter.notifier)
                  .setFilter(Filter.glutenFree, ifGlutenFree);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              'Only Include Gluten-Free Meal',
              style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.onSurface,
              ),
            ),
            activeThumbColor: Theme.of(ctx).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.lactoseFree]!, //isGlutenFree,
            onChanged: (ifLactoseFree) {
              /*  setState(() {
                  isGlutenFree = ifGlutenFree;
                });*/
              ref
                  .read(filter.notifier)
                  .setFilter(Filter.lactoseFree, ifLactoseFree);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              'Only Include lactose-Free Meal',
              style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.onSurface,
              ),
            ),
            activeThumbColor: Theme.of(ctx).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegetarian]!, //isGlutenFree,
            onChanged: (ifvegetarianFree) {
              /*  setState(() {
                  isGlutenFree = ifGlutenFree;
                });*/
              ref
                  .read(filter.notifier)
                  .setFilter(Filter.vegetarian, ifvegetarianFree);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              'Only Include Vegetarian Meal',
              style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.onSurface,
              ),
            ),
            activeThumbColor: Theme.of(ctx).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegan]!, //isGlutenFree,
            onChanged: (ifVeganFree) {
              /*  setState(() {
                  isGlutenFree = ifGlutenFree;
                });*/
              ref.read(filter.notifier).setFilter(Filter.vegan, ifVeganFree);
            },
            title: Text(
              'Vegan',
              style: Theme.of(ctx).textTheme.titleLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              'Only Include Vegan Meal',
              style: Theme.of(ctx).textTheme.bodyLarge!.copyWith(
                color: Theme.of(ctx).colorScheme.onSurface,
              ),
            ),
            activeThumbColor: Theme.of(ctx).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
