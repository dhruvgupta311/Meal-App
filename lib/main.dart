import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meal_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Daily meal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: CategoryScreen(),
      routes:{
        CategoryMealsScreen.routeName:(ctx)=>CategoryMealsScreen(),
      },
    );
  }
}
