import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_app/models/categories.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget{
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);
  static const routeName ='/category-meal';
  @override
  Widget build(BuildContext context){
  final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
  final categoryTitle=routeArgs['title'];
  final categoryId=routeArgs['id'];
  final categoryMeal=DUMMY_MEALS.where((meal){
    return meal.categories.contains(categoryId);
  }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle as String),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return Text(categoryMeal[index].title);
      },itemCount: categoryMeal.length,
      ),
    );
  }
}