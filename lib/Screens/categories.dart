import 'package:flutter/material.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite});

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, String title, List<Meal> meals) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => MealsScreen(title: title, meals: meals,onToggleFavorite: onToggleFavorite,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: availableCategories
            .map(
              (c) => CategoryGridItem(
                category: c,
                onSelectCategory: () {
                  _selectCategory(
                    context,
                    c.title,
                    dummyMeals
                        .where((m) => m.categories.contains(c.id))
                        .toList(),
                  );
                },
              ),
            )
            .toList(),
      );
  }
}
