import 'dart:convert';

List<MealPlan> mealPlanFromJson(String str) =>
    List<MealPlan>.from(json.decode(str).map((x) => MealPlan.fromJson(x)));

String mealPlanToJson(List<MealPlan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MealPlan {
  DateTime date;
  String day;
  Meals meals;

  MealPlan({
    required this.date,
    required this.day,
    required this.meals,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) => MealPlan(
        date: DateTime.parse(json["date"]),
        day: json["day"],
        meals: Meals.fromJson(json["meals"]),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day,
        "meals": meals.toJson(),
      };
}

class Meals {
  List<Breakfast> breakfast;
  List<Breakfast> lunch;
  List<Breakfast> dinner;

  Meals({
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        breakfast: List<Breakfast>.from(
            json["breakfast"].map((x) => Breakfast.fromJson(x))),
        lunch: List<Breakfast>.from(
            json["lunch"].map((x) => Breakfast.fromJson(x))),
        dinner: List<Breakfast>.from(
            json["dinner"].map((x) => Breakfast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "breakfast": List<dynamic>.from(breakfast.map((x) => x.toJson())),
        "lunch": List<dynamic>.from(lunch.map((x) => x.toJson())),
        "dinner": List<dynamic>.from(dinner.map((x) => x.toJson())),
      };
}

class Breakfast {
  Id id;
  String name;
  String image;
  int kcal;
  String weight; // CHANGED to String
  Nutrients nutrients;
  Recipe recipe;

  Breakfast({
    required this.id,
    required this.name,
    required this.image,
    required this.kcal,
    required this.weight,
    required this.nutrients,
    required this.recipe,
  });

  factory Breakfast.fromJson(Map<String, dynamic> json) => Breakfast(
        id: idValues.map[json["id"]]!,
        name: json["name"],
        image: json["image"],
        kcal: json["kcal"],
        weight: json["weight"] ?? "", // direct string from API
        nutrients: Nutrients.fromJson(json["nutrients"]),
        recipe: Recipe.fromJson(json["recipe"]),
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": name,
        "image": image,
        "kcal": kcal,
        "weight": weight,
        "nutrients": nutrients.toJson(),
        "recipe": recipe.toJson(),
      };
}

enum Id { MEAL_001, MEAL_002 }

final idValues = EnumValues({
  "meal_001": Id.MEAL_001,
  "meal_002": Id.MEAL_002,
});

class Nutrients {
  Protein protein;
  Carbohydrates carbohydrates;
  Fat fat;

  Nutrients({
    required this.protein,
    required this.carbohydrates,
    required this.fat,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
        protein: proteinValues.map[json["protein"]]!,
        carbohydrates: carbohydratesValues.map[json["carbohydrates"]]!,
        fat: fatValues.map[json["fat"]]!,
      );

  Map<String, dynamic> toJson() => {
        "protein": proteinValues.reverse[protein],
        "carbohydrates": carbohydratesValues.reverse[carbohydrates],
        "fat": fatValues.reverse[fat],
      };
}

enum Carbohydrates { THE_20_G, THE_40_G }

final carbohydratesValues = EnumValues({
  "20g": Carbohydrates.THE_20_G,
  "40g": Carbohydrates.THE_40_G,
});

enum Fat { THE_16_G, THE_32_G }

final fatValues = EnumValues({
  "16g": Fat.THE_16_G,
  "32g": Fat.THE_32_G,
});

enum Protein { THE_26_G, THE_52_G }

final proteinValues = EnumValues({
  "26g": Protein.THE_26_G,
  "52g": Protein.THE_52_G,
});

class Recipe {
  String prepTime; // CHANGED from enum to String
  List<String> ingredients;
  List<String> tips;

  Recipe({
    required this.prepTime,
    required this.ingredients,
    required this.tips,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        prepTime: json["prepTime"] ?? "",
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        tips: List<String>.from(json["tips"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "prepTime": prepTime,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "tips": List<dynamic>.from(tips.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

