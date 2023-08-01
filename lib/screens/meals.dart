import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.meal, required this.title,});
  final List<Meal> meal;
  final String title;

  @override
  Widget build( context) {
    Widget content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: ((context, index) => MealItem(meal: meal[index],)));

    if (meal.isEmpty) {
      content = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            "uh....oh nothing here",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: const Color.fromARGB(255, 167, 167, 167)),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Try selecting a different category",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: const Color.fromARGB(255, 167, 167, 167)),
          )
        ]),
      );
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          )),
      body: content,
    );
  }
}
