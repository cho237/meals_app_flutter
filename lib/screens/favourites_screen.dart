import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouritesMeals;

  const FavoritesScreen(this.favouritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favouritesMeals.isEmpty) {
      return Center(
        child: Text(" you have no favourites yet -start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favouritesMeals[index].id,
            title: favouritesMeals[index].title,
            imageUrl: favouritesMeals[index].imageUrl,
            duration: favouritesMeals[index].duration,
            complexity: favouritesMeals[index].complexity,
            affordability: favouritesMeals[index].affordability,
     
          );
        },
        itemCount: favouritesMeals.length,
      );
    }
  }
}
