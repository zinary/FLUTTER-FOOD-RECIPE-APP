import 'package:flutter/material.dart';
import './catagories_screen.dart';
import './favorites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              labelColor: Colors.white,

              tabs: <Widget>[

                Tab(text: 'All',icon: Icon(Icons.category),),
                Tab(text: 'Favorite',icon: Icon(Icons.star),)

                
              ],
            ),
          ),
          body: TabBarView(children: [
            CatagoriesScreen(),
            FavoritesScreen()
          ]),
        ));
  }
}
