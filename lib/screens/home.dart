import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/grid_container.dart';
import 'package:meal_app/widgets/meal_drawer.dart';

late final Map<Filters, bool> result;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.tanikmeal});

  final List<Meal> tanikmeal;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        upperBound: 1,
        lowerBound: 0,
        duration: const Duration(milliseconds: 300));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectedCategory(context, Category category) {
    final actualmeal = widget.tanikmeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Meals(
          title: category.title,
          meal: actualmeal,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Categories ",
        ),
      ),
      drawer: const MealDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AnimatedBuilder(
              animation: _animationController,
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 3 / 2.2),
                  children: [
                    for (Category category in availableCategories)
                      GridContainer(
                        category: category,
                        onselectedCategory: () {
                          _selectedCategory(context, category);
                        },
                      ),
                  ]),
              builder: (context, child) => SlideTransition(
                  child: child,
                  position: Tween(
                          begin: const Offset(0, 0.3), end: const Offset(0, 0))
                      .animate(CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut))))),
      // ),
    );
  }
}
