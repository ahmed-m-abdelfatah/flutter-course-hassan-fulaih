import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/layout/tabs_screen.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/modules/category_meals_screen/category_meals_screen.dart';
import 'package:meal_app/modules/filters_screen/filters_screen.dart';
import 'package:meal_app/modules/meal_detail_screen/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['vegetarian']! && !meal.isVegetarian) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    // if not in _favoriteMeals list it will be -1 and add to _favoriteMeals list
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    //  if it is in _favoriteMeals it will remove it
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      // add to _favoriteMeals
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: HomeScreen(),
      routes: {
        '/': (context) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(availableMeal: _availableMeal),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(toggleFavorite: _toggleFavorite, isMealFavorite: _isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(saveFilters: _setFilters, currentFilters: _filters),
      },
    );
  }
}
