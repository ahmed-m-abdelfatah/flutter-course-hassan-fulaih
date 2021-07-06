import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/modules/meal_detail_screen/meal_detail_screen.dart';
import 'package:meal_app/shared/components/constants.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final int duration;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  // final Function removeMeal;

  const MealItem({
    required this.id,
    required this.imageUrl,
    required this.duration,
    required this.title,
    required this.affordability,
    required this.complexity,
    // required this.removeMeal,
  });

  String get _complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return ' Simple';
      case Complexity.Challenging:
        return ' Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get _affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return ' Affordable';
      case Affordability.Pricey:
        return ' Pricey';
      case Affordability.Luxurious:
        return ' Luxurious';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id).then((result) {
      // print(result);
      // if (result != null) removeMeal(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: myBorderRadius(),
        ),
        elevation: 4,
        margin: myEdgeInsets(num: 10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: myEdgeInsets(num: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$duration min')
                  ]),
                  Row(children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text(_complexityText)
                  ]),
                  Row(children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text(_affordabilityText)
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
