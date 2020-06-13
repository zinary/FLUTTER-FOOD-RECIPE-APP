import 'package:flutter/material.dart';
import './screens/tab_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/selected_category_meal_screen.dart';
// import './screens/catagories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Colors.a,
        
        primaryColor: Colors.red,
        accentColor: Colors.amber,
        canvasColor: Colors.grey[100],
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(fontSize: 22,color: Colors.white,fontFamily: 'ProductSans',fontWeight: FontWeight.bold,letterSpacing: 2),
          headline5: TextStyle(fontSize: 22,color: Colors.white,fontFamily: 'ProductSans',fontWeight: FontWeight.bold,),
          bodyText1: TextStyle(color: Colors.grey[800],fontFamily: 'ProductSans',fontSize: 16,fontWeight: FontWeight.normal),
          bodyText2: TextStyle(color: Colors.grey[800],fontFamily: 'ProductSans',fontSize: 20,fontWeight: FontWeight.normal),
        )
      ),
      home: TabScreen(),
      routes: {
       SelectedCategoryMealScreen.routeName: (ctx) => SelectedCategoryMealScreen(),
       MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
      },
    );
  }
}

