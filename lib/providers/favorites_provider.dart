import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_apps_navigating_screens/models/meal.dart';

class FavoriteMealsNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() => [];

  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    NotifierProvider<FavoriteMealsNotifier, List<Meal>>(
      FavoriteMealsNotifier.new,
    );
