import 'package:flutter/material.dart';

class MealItem extends StatelessWidget{
  const MealItem(this.icon,this.label,{super.key});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
   return 
  Row(children:[
      Icon(icon,color: Colors.white,size: 14,),
      SizedBox(width: 6,),
      //width: double.infinity,
      Text(label,style: TextStyle(color: Colors.white,fontSize: 14,),overflow: TextOverflow.ellipsis,),
     ]
   );
  }
}