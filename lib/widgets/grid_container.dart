import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meals.dart';

class GridContainer extends StatelessWidget {
  GridContainer({required this.category,required this.onselectedCategory, super.key});
  final  Category category;
 final void Function() onselectedCategory;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onselectedCategory,
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                category.color.withOpacity(0.9),
                category.color.withOpacity(0.55),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
              child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.background),
          )),
        ),
      ),
    );
  }
}
