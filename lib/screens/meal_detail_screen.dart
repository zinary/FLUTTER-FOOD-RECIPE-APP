import 'package:flutter/material.dart';
// import 'package:meals/models/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail_screen';
  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetailScreen(this.toggleFavorite,this.isMealFavorite);
  Widget buildListContainer({BuildContext context, Widget child}) {
    return Container(
        // margin: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          // borderRadius: BorderRadius.circular(15)
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: child);
  }

  Widget buildTitleContainer({BuildContext context, String title}) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.all(5),
      child: Text(
        title,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.4,
              // width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            buildTitleContainer(title: 'Ingredients', context: context),
            buildListContainer(
              context: context,
              child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedMeal.ingredients
                      .map(
                        (items) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            color: Colors.red,
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                items,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList()),
            ),
            buildTitleContainer(title: 'Steps', context: context),
            Column(
              children: <Widget>[
                ...selectedMeal.steps
                    .map((step) => Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                step,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Divider()
                          ],
                        ))
                    .toList()
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // tooltip: 'Remove Item',
        onPressed: () => toggleFavorite(mealId),
        child: isMealFavorite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border) ,
      ),
    );
  }
}
