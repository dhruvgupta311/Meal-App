import 'package:flutter/material.dart';
import '../widgets/categories_item.dart';
import '../dummy_data.dart';
class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Daily Meals'),
      ),
       body:GridView(
        padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((catData)=>CategoryItem(
        catData.id,
        catData.title, 
        catData.color,
        // these two are arguments that category class accepts
        ))
        .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    ),
    );  
  }
}