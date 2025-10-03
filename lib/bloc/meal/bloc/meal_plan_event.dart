
//lib/blocs/meal_plan/meal_plan_event.dart
abstract class MealPlanEvent {}

class LoadMealPlans extends MealPlanEvent {}

class SelectDay extends MealPlanEvent {
  final int dayIndex;
  SelectDay(this.dayIndex);
}

class SelectMealType extends MealPlanEvent {
  final int mealTypeIndex;
  SelectMealType(this.mealTypeIndex);
}

