import 'package:flutter/material.dart';
import 'package:meal_app/modules/category_meals_screen/category_meals_screen.dart';
import 'package:meal_app/shared/components/constants.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    Color _splashColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: _splashColor,
      borderRadius: myBorderRadius(),
      child: Container(
        padding: myEdgeInsets(),
        child: Text(
          title,
          style: titleStyle(context),
        ),
        decoration: BoxDecoration(
            borderRadius: myBorderRadius(),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.4),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }
}
