import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favourite_provider.dart';
import 'package:meal_app/providers/filter_provider.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/home.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/meal_drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int activeScreenIndex = 0;

  void _selectPage(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  @override
  Widget build(context) {


    final availableMeal = ref.watch(filterMealProvider);

    Widget activeScreen = Homescreen(
      tanikmeal: availableMeal,
    );
    if (activeScreenIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activeScreen = Meals(
        meal: favouriteMeals,
        title: "Your Favourite",
      );
    }
    return Scaffold(
      body: activeScreen,
      drawer: const MealDrawer(
          // onselectedScreen: _setScreen,
          ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: activeScreenIndex,
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourite")
          ]),
    );
  }
}
