import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'Filter-Screen';
  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen({this.saveFilters,this.currentFilters});
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;
@override
  void initState() {
    
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                print('iconbutton');
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
              return  widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchTile(
                    title: 'Gluten-Free',
                    description: 'Only show Gluten free foods',
                    currentValue: _glutenFree,
                    updateValue: (newvalue) {
                      setState(() {
                        _glutenFree = newvalue;
                      });
                    }),
                buildSwitchTile(
                    title: 'Lactose-Free',
                    description: 'Only show Lactose free foods',
                    currentValue: _lactoseFree,
                    updateValue: (newvalue) {
                      setState(() {
                        _lactoseFree = newvalue;
                      });
                    }),
                buildSwitchTile(
                    title: 'Vegan',
                    description: 'Only show Vegan foods',
                    currentValue: _vegan,
                    updateValue: (newvalue) {
                      setState(() {
                        _vegan = newvalue;
                      });
                    }),
                buildSwitchTile(
                    title: 'Vegetarian',
                    description: 'Only show Vegetarian foods',
                    currentValue: _vegetarian,
                    updateValue: (newvalue) {
                      setState(() {
                        _vegetarian = newvalue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSwitchTile(
    {String title,
    String description,
    bool currentValue,
    Function updateValue}) {
  return SwitchListTile(
    title: Text(title, style: TextStyle(fontSize: 18)),
    value: currentValue,
    subtitle: Text(description, style: TextStyle(fontSize: 15)),
    onChanged: updateValue,
  );
}
