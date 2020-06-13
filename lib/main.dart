import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tab_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/selected_category_meal_screen.dart';
import './models/meal.dart';
// import './screens/catagories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
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

  void _setFilters(Map<String, bool> filterData) {
    print('setfilters');
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      
    });
  }
  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)
        );
      });
    }

  } 

  bool _isMealFavorite(String id  ){
    return _favoriteMeals.any((meal) => meal.id == id);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primarySwatch: Colors.a,

          primaryColor: Colors.red,
          accentColor: Colors.amber,
          canvasColor: Colors.grey[100],
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
                headline5: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                ),
                headline4: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.bold,
                ),
                bodyText1: TextStyle(
                    color: Colors.grey[800],
                    fontFamily: 'ProductSans',
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                bodyText2: TextStyle(
                    color: Colors.grey[800],
                    fontFamily: 'ProductSans',
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              )),
      home: TabScreen(_favoriteMeals),
      routes: {
        SelectedCategoryMealScreen.routeName: (ctx) =>
            SelectedCategoryMealScreen(avaiableMeals: _availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(currentFilters: _filters, saveFilters: _setFilters),
      },
    );
  }
}
