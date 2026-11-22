import'package:flutter/material.dart';
import 'package:meal_app/models/category_blueprint.dart';
class GridItems extends StatelessWidget{
  const GridItems(this.category,this.byTapping,{super.key});
  final Category category;
 final void Function() byTapping;
  @override
  Widget build(ctx){
    return InkWell(
     onTap:byTapping,
     splashColor: Theme.of(ctx).primaryColor,
      child: Container(
        padding:EdgeInsets.all(16),
      decoration:BoxDecoration(gradient:LinearGradient(
        colors:[
      category.color.withValues(alpha: 0.55),
      category.color.withValues(alpha:0.9),
        ],
        begin: Alignment.topLeft,
        end:Alignment.bottomRight,
        
      ),borderRadius: BorderRadius.circular(19),),
      child:Text(category.title,style:Theme.of(ctx).textTheme.titleLarge!.copyWith(
        color:Theme.of(ctx).colorScheme.onSurface
      ),),
      ),
    );
  }
}