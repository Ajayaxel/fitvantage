class Exercise {
  final int id;
  final String name;
  final String description;
  final String? timeInMinutes;
  final String sets;
  final String? reps;
  final String? images;
  final String workoutTypeId;
  final String bodyPartId;
  final String isActive;
  final String? createdAt;
  final String? updatedAt;
  final BodyPart getBodyPart;
  final WorkoutType getWorkoutType;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    this.timeInMinutes,
    required this.sets,
    this.reps,
    this.images,
    required this.workoutTypeId,
    required this.bodyPartId,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    required this.getBodyPart,
    required this.getWorkoutType,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      timeInMinutes: json['time_in_minutes'],
      sets: json['sets'],
      reps: json['reps'],
      images: json['images'],
      workoutTypeId: json['workout_type_id'],
      bodyPartId: json['body_part_id'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      getBodyPart: BodyPart.fromJson(json['get_body_part']),
      getWorkoutType: WorkoutType.fromJson(json['get_workout_type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'time_in_minutes': timeInMinutes,
      'sets': sets,
      'reps': reps,
      'images': images,
      'workout_type_id': workoutTypeId,
      'body_part_id': bodyPartId,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'get_body_part': getBodyPart.toJson(),
      'get_workout_type': getWorkoutType.toJson(),
    };
  }
}

class BodyPart {
  final int id;
  final String name;
  final String? description;
  final String isActive;
  final String? createdAt;
  final String? updatedAt;

  BodyPart({
    required this.id,
    required this.name,
    this.description,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory BodyPart.fromJson(Map<String, dynamic> json) {
    return BodyPart(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class WorkoutType {
  final int id;
  final String name;
  final String? description;
  final String ordinal;
  final String isActive;
  final String? createdAt;
  final String? updatedAt;

  WorkoutType({
    required this.id,
    required this.name,
    this.description,
    required this.ordinal,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory WorkoutType.fromJson(Map<String, dynamic> json) {
    return WorkoutType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      ordinal: json['ordinal'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ordinal': ordinal,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

