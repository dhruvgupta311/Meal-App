import 'package:flutter/material.dart';
import 'package:meal_app/models/categories.dart';
import '/screens/categories_screen.dart'; 
import 'favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget{
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>{
  List<Map<String, Object>> _pages=[
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(),
        'title': 'Your Favorite',
      },
  ];
   int _selectedPageIndex = 0;
   void _selectPage(int index){
   setState((){
      _selectedPageIndex = index;
    });
  }
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),
         ),
         drawer: MainDrawer(),
        body:_pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
         unselectedItemColor: Colors.white,
         selectedItemColor: Color.fromARGB(255, 227, 206, 17),
         currentIndex: _selectedPageIndex,
        //  type: BottomNavigationBarType.fixed,
         items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label:'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favourites',
           ),
         ],
       ),
    );
  }
}