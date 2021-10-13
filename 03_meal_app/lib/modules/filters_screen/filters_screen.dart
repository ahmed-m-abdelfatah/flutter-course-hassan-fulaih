import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/shared/components/constants.dart';
import 'package:meal_app/shared/components/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen({required this.saveFilters, required this.currentFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool switchKey,
    required Function updateValue,
  }) {
    return SwitchListTile(
      value: switchKey,
      onChanged: (bool newValue) => updateValue(newValue),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilers = {
                'gluten': _glutenFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
                'lactose': _lactoseFree,
              };

              widget.saveFilters(selectedFilers);
            },
            icon: Icon(Icons.save),
            tooltip: "Click Here To Safe Your Filters",
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: myEdgeInsets(num: 20),
            child: Text("Adjust Your Meal Selection.", style: titleStyle(context)),
          ),
          Expanded(
            child: ListView(
              children: [
                // SwitchListTile(
                //   value: _glutenFree,
                //   onChanged: (bool newValue) {
                //     setState(() {
                //       _glutenFree = newValue;
                //     });
                //   },
                //   title: Text("Gluten Free"),
                //   subtitle: Text("Only Include Gluten Free Meals."),
                // ),
                buildSwitchListTile(
                  title: "Gluten-Free",
                  subtitle: "Only Include Gluten Free Meals.",
                  switchKey: _glutenFree,
                  updateValue: (bool newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: "Lactose-Free",
                  subtitle: "Only Include Lactose Free Meals.",
                  switchKey: _lactoseFree,
                  updateValue: (bool newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: "Vegetarian",
                  subtitle: "Only Include Vegetarian Meals.",
                  switchKey: _vegetarian,
                  updateValue: (bool newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: "Vegan",
                  subtitle: "Only Include Vegan Meals.",
                  switchKey: _vegan,
                  updateValue: (bool newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
