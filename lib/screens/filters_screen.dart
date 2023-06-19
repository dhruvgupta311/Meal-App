import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
 static const routeName = '/filters';
 final Function saveFilters;
 final Map<String,bool> currentFilters;
 FilterScreen(this.currentFilters,this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool? _glutenFree = false;
  bool? _vegetarian = false;
  bool? _vegan = false;
  bool? _lactoseFree = false;
  @override
  void initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

   Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ){
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged:(val){
       ()=> updateValue();
      },
    );
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'),
      actions: [
        IconButton(
          onPressed:() {
            final selectedFilters= {
    'gluten': _glutenFree,
    'lactose': _lactoseFree,
    'vegan': _vegan,
    'vegetarian': _vegetarian,
  };
            widget.saveFilters(selectedFilters);
            }, 
          icon:  Icon(Icons.save)),
      ],
      ),
      drawer: MainDrawer(),
      body:Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            
            child: Text(
              'Adjust your meal selection.',
              
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
           Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree ?? false,
                  (newValue) {
                    setState(
                      (){
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree ?? false,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian ?? false,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan ?? false,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
            ),
        ],
      ),
   );
  }
}