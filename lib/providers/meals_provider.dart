import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_apps_navigating_screens/data/dummy_data.dart';
import 'package:flutter_screen_apps_navigating_screens/models/meal.dart';

final mealsProvider = Provider<List<Meal>>((ref) {
  return dummyMeals;
});
