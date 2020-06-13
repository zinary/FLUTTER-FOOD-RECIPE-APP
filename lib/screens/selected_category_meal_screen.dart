import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import '../widgets/meal_item.dart';
// import '../models/meal.dart';

class SelectedCategoryMealScreen extends StatelessWidget {
  static const routeName = 'selected_category';
  // final String title;
  // final String categoryId;
  // SelectedCategoryMealScreen({
  //    @required this.title,
  //    @required this.categoryId,
  // });
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final itemId = routeArgs['itemId'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(itemId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: color,
        title: Hero(
          tag: title,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          
          return MealItem(id: categoryMeals[index].id, title:categoryMeals[index].title,imageUrl:categoryMeals[index].imageUrl, duration: categoryMeals[index].duration, affordability: categoryMeals[index].affordability, complexity: categoryMeals[index].complexity,);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
