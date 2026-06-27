import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_apps_navigating_screens/models/meal.dart';
import 'package:flutter_screen_apps_navigating_screens/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FilterNotifier extends Notifier<Map<Filter, bool>> {
  @override
  Map<Filter, bool> build() => {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  };

  void setAllFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider = NotifierProvider<FilterNotifier, Map<Filter, bool>>(
  FilterNotifier.new,
);

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final activeFilters = ref.watch(filtersProvider);
  final meals = ref.watch(mealsProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
