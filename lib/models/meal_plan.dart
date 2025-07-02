import 'dart:convert';

List<MealPlan> mealPlanFromJson(String str) => List<MealPlan>.from(json.decode(str).map((x) => MealPlan.fromJson(x)));

String mealPlanToJson(List<MealPlan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MealPlan {
    int id;
    String customerId;
    String trainerId;
    String name;
    String description;
    String version;
    DateTime startDate;
    DateTime endDate;
    List<MealPlanJson> mealPlanJson;
    String dos;
    String donts;
    bool status;
    DateTime createdAt;
    DateTime updatedAt;

    MealPlan({
        required this.id,
        required this.customerId,
        required this.trainerId,
        required this.name,
        required this.description,
        required this.version,
        required this.startDate,
        required this.endDate,
        required this.mealPlanJson,
        required this.dos,
        required this.donts,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory MealPlan.fromJson(Map<String, dynamic> json) => MealPlan(
        id: json["id"],
        customerId: json["customer_id"],
        trainerId: json["trainer_id"],
        name: json["name"],
        description: json["description"],
        version: json["version"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        mealPlanJson: List<MealPlanJson>.from(json["meal_plan_json"].map((x) => MealPlanJson.fromJson(x))),
        dos: json["dos"],
        donts: json["donts"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "trainer_id": trainerId,
        "name": name,
        "description": description,
        "version": version,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "meal_plan_json": List<dynamic>.from(mealPlanJson.map((x) => x.toJson())),
        "dos": dos,
        "donts": donts,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class MealPlanJson {
    String dayName;
    List<MealType> mealTypes;

    MealPlanJson({
        required this.dayName,
        required this.mealTypes,
    });

    factory MealPlanJson.fromJson(Map<String, dynamic> json) => MealPlanJson(
        dayName: json["day_name"],
        mealTypes: List<MealType>.from(json["meal_types"].map((x) => MealType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "day_name": dayName,
        "meal_types": List<dynamic>.from(mealTypes.map((x) => x.toJson())),
    };
}

class MealType {
    TypeName typeName;
    int typeId;
    List<Meal> meals;

    MealType({
        required this.typeName,
        required this.typeId,
        required this.meals,
    });

    factory MealType.fromJson(Map<String, dynamic> json) => MealType(
        typeName: typeNameValues.map[json["type_name"]]!,
        typeId: json["type_id"],
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type_name": typeNameValues.reverse[typeName],
        "type_id": typeId,
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
    };
}

class Meal {
    String? quantity;
    String? unitId;
    String? categoryId;
    int? dishId;

    Meal({
        required this.quantity,
        required this.unitId,
        required this.categoryId,
        required this.dishId,
    });

    factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        quantity: json["quantity"],
        unitId: json["unit_id"],
        categoryId: json["category_id"],
        dishId: json["dish_id"],
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "unit_id": unitId,
        "category_id": categoryId,
        "dish_id": dishId,
    };
}

enum TypeName {
    BREAKFAST,
    LUNCH,
    MEAL_TYPE_3,
    MEAL_TYPE_4
}

final typeNameValues = EnumValues({
    "Breakfast": TypeName.BREAKFAST,
    "Lunch": TypeName.LUNCH,
    "Meal Type 3": TypeName.MEAL_TYPE_3,
    "Meal Type 4": TypeName.MEAL_TYPE_4
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
