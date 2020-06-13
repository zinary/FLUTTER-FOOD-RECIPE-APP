import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            height: 100,
            width: double.infinity,
            color: Colors.red,
            child: Text('Cooking Up!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.white)),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(
            height: 20,
          ),
          DrawerList(
            title: 'Meals',
            icon: Icons.restaurant,
            tapHandler: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(
            height: 20,
          ),
          DrawerList(
            title: 'Filters',
            icon: Icons.filter_list,
            tapHandler: (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);

            },
          ),
        ],
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function tapHandler;
  const DrawerList({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.tapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tapHandler,
      trailing: Icon(
        icon,
        size: 25,
        color: Colors.grey[600],
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
