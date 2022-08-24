import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegitarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegitarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    var currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("your filters"),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFilters = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegitarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save),
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Ajust your meal selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  "Gluten free",
                  "only include gluten-free meals",
                  _glutenFree,
                  (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Lactose free",
                  "only include lactose-free meals",
                  _lactoseFree,
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegitarian",
                  "only include vegitarian meals",
                  _vegitarian,
                  (value) {
                    setState(() {
                      _vegitarian = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "only include vegan meals",
                  _vegan,
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }
}
