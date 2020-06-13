import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';
import './screens/selected_category_meal_screen.dart';
import './screens/catagories_screen.dart';

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
      home: Home(),
      routes: {
       SelectedCategoryMealScreen.routeName: (ctx) => SelectedCategoryMealScreen(),
       MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        
        centerTitle: true,
        // backgroundColor: Colors.red,
        title: Text(
        
          'Meals',
          style: Theme.of(context).textTheme.headline6,
        ),
        titleSpacing: 5,
      ),
      body: CatagoriesScreen(),
      // floatingActionButton: FloatingActionButton(onPressed: null),
    );
  }
}
