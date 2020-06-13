import 'package:flutter/material.dart';
import '../screens/selected_category_meal_screen.dart';

// import '../selected_category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String itemId;
  CategoryItem({this.title, this.color, this.itemId});

  void selectedMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SelectedCategoryMealScreen.routeName,arguments: {
      'title':title,
      'itemId':itemId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.black,
      onTap: () => selectedMeal(context),
      child: Container(
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.grey[100],
          //     Colors.grey[200],

          //     Colors.grey[300],
          //     Colors.grey[400],
          //     Colors.grey[500],
          //   ],
          //   begin: Alignment.bottomRight,
          //   end: Alignment.topLeft,
          // ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[100],
                offset: Offset(-3, -3),
                blurRadius: 5,
                spreadRadius: 5),
            BoxShadow(
                color: Colors.grey[300],
                offset: Offset(3, 3),
                blurRadius: 5,
                spreadRadius: 1),
          ],
        ),
      ),
    );
  }
}
