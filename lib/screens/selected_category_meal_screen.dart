import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
// import '../models/meal.dart';

class SelectedCategoryMealScreen extends StatefulWidget {
  static const routeName = 'selected_category';
  final List<Meal> avaiableMeals;
  SelectedCategoryMealScreen({this.avaiableMeals});
  @override
  _SelectedCategoryMealScreenState createState() =>
      _SelectedCategoryMealScreenState();
}

class _SelectedCategoryMealScreenState
    extends State<SelectedCategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var loadInitData = false;

  @override
  void didChangeDependencies() {
    if (!loadInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final itemId = routeArgs['itemId'];
      displayedMeals = widget.avaiableMeals.where((meal) {
        return meal.categories.contains(itemId);
      }).toList();
      loadInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
     displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: color,
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
