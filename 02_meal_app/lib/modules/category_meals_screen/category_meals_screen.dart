import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/modules/category_meals_screen/category_meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> availableMeal;

  const CategoryMealsScreen({required this.availableMeal});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  @override
  /* didChangeDependencies() == initState() */
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title']!;
    displayedMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle Recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            id: displayedMeals[index].id,
            // removeMeal: _removeMeal,
            //  _removeMeal Go to removeMeal & execute removeMeal(result)
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
