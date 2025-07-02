// lib/bloc/meal_plan_event.dart
import 'package:flutter/foundation.dart';

@immutable
abstract class MealPlanEvent {}

class FetchMealPlans extends MealPlanEvent {}


