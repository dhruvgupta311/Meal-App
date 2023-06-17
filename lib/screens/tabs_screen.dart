import 'package:flutter/material.dart';
import 'package:meal_app/models/categories.dart';
import '/screens/categories_screen.dart'; 
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
               icon: Icon(Icons.category),
            text: 'Categories',
            ),
            Tab(
               icon: Icon(Icons.star),
            text: 'Favorites',
          ),
          ],
         ),
        ),
        body: TabBarView(
          children: [
            CategoryScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}