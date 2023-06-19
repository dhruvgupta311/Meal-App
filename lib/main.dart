import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meal_screen.dart';
import './screens/meal_detail_scree.dart';
import './screens/filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
   List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] != null && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] != null && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] != null && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] != null && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

   void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }
  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Daily meal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    //  home: CategoryScreen(),
      routes:{
        '/': (ctx) =>TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName:(ctx)=>CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName:(ctx)=>FilterScreen(_filters,_setFilters),
      },
    );
  }
}
