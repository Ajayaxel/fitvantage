// Request Model
class AiMealPlanRequest {
  final List<String> goals;
  final List<String> dietary;
  final int calorieTarget;
  final int mealsPerDay;

  AiMealPlanRequest({
    required this.goals,
    required this.dietary,
    required this.calorieTarget,
    required this.mealsPerDay,
  });

  Map<String, dynamic> toJson() => {
    "goals": goals,
    "dietary": dietary,
    "calorieTarget": calorieTarget,
    "mealsPerDay": mealsPerDay,
  };
}

// Response Models
class AiMealPlanResponse {
  final bool success;
  final AiMealPlan mealPlan;

  AiMealPlanResponse({
    required this.success,
    required this.mealPlan,
  });

  factory AiMealPlanResponse.fromJson(Map<String, dynamic> json) => AiMealPlanResponse(
    success: json["success"],
    mealPlan: AiMealPlan.fromJson(json["mealPlan"]),
  );
}

class AiMealPlan {
  final DateTime generatedAt;
  final AiPreferences preferences;
  final List<AiMeal> meals;
  final AiTotalNutrition totalNutrition;
  final bool isFavorite;
  final String id;
  final int v;

  AiMealPlan({
    required this.generatedAt,
    required this.preferences,
    required this.meals,
    required this.totalNutrition,
    required this.isFavorite,
    required this.id,
    required this.v,
  });

  factory AiMealPlan.fromJson(Map<String, dynamic> json) => AiMealPlan(
    generatedAt: DateTime.parse(json["generatedAt"]),
    preferences: AiPreferences.fromJson(json["preferences"]),
    meals: List<AiMeal>.from(json["meals"].map((x) => AiMeal.fromJson(x))),
    totalNutrition: AiTotalNutrition.fromJson(json["totalNutrition"]),
    isFavorite: json["isFavorite"],
    id: json["_id"],
    v: json["__v"],
  );
}

class AiPreferences {
  final List<String> goals;
  final List<String> dietary;
  final int calorieTarget;
  final int mealsPerDay;

  AiPreferences({
    required this.goals,
    required this.dietary,
    required this.calorieTarget,
    required this.mealsPerDay,
  });

  factory AiPreferences.fromJson(Map<String, dynamic> json) => AiPreferences(
    goals: List<String>.from(json["goals"]),
    dietary: List<String>.from(json["dietary"]),
    calorieTarget: json["calorieTarget"],
    mealsPerDay: json["mealsPerDay"],
  );
}

class AiMeal {
  final String mealType;
  final String name;
  final String description;
  final String imageUrl;
  final AiNutrition nutrition;
  final List<String> ingredients;
  final List<String> instructions;
  final String id;

  AiMeal({
    required this.mealType,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.nutrition,
    required this.ingredients,
    required this.instructions,
    required this.id,
  });

  factory AiMeal.fromJson(Map<String, dynamic> json) => AiMeal(
    mealType: json["mealType"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"] ?? "",
    nutrition: AiNutrition.fromJson(json["nutrition"]),
    ingredients: List<String>.from(json["ingredients"]),
    instructions: List<String>.from(json["instructions"]),
    id: json["_id"],
  );
}

class AiNutrition {
  final int calories;
  final int protein;
  final int carbs;
  final int fats;

  AiNutrition({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  factory AiNutrition.fromJson(Map<String, dynamic> json) => AiNutrition(
    calories: json["calories"],
    protein: json["protein"],
    carbs: json["carbs"],
    fats: json["fats"],
  );
}

class AiTotalNutrition {
  final int calories;
  final int protein;
  final int carbs;
  final int fats;

  AiTotalNutrition({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  factory AiTotalNutrition.fromJson(Map<String, dynamic> json) => AiTotalNutrition(
    calories: json["calories"],
    protein: json["protein"],
    carbs: json["carbs"],
    fats: json["fats"],
  );
}
