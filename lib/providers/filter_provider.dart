import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/filters.dart';

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutenfree: false,
          Filters.lactosefree: false,
          Filters.vegan: false,
          Filters.vegeterian: false
        });

  void setFilter(Filters filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<Filters, bool> choosenFilters) {
    state = choosenFilters;
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>(
        (ref) => FilterNotifier());

final filterMealProvider = Provider((ref) {
 final activeFilters =  ref.watch(filterProvider);

  return dummyMeals.where((meal) {
    if (activeFilters[Filters.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filters.vegeterian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
